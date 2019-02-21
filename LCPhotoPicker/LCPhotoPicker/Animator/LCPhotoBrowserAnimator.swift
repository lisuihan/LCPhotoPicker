//
//  LCPhotoBrowserAnimator.swift
//  LCPhotoPicker
//
//  Created by ucf-y on 2019/2/14.
//  Copyright © 2019 ucf-y. All rights reserved.
//

import UIKit

public protocol PhotoBrowserAnimatorPushDeleagte : class{
    //获取图片动画前的位置
    func imageViewRectOfAnimatorStart(at indexPath : IndexPath) -> CGRect
    /// 获取图片动画后的位置
    func imageViewRectOfAnimatorEnd(at indexPath : IndexPath) -> CGRect
     /// 获取点击的imageView
    func imageView(at indexPath : IndexPath) -> UIImageView
}

public protocol PhotoBrowserAnimatorPopDelegate : class{
     /// 获取当前浏览的图片的下标
    func indexOfPopViewImageView() -> IndexPath
    /// 获取当前浏览的图片
    func imageViewOfPopView() -> UIImageView
}

public enum TransitionType : Int {
    case navigation
    case modal
}

public class LCPhotoBrowserAnimator: NSObject {

    public var transitionType : TransitionType = .navigation
    public var isPresent : Bool!
    
    public weak var popDelegate : PhotoBrowserAnimatorPopDelegate?
    public weak var pushDelegate : PhotoBrowserAnimatorPushDeleagte?
    public var selIndex : IndexPath?
    public var operation : UINavigationController.Operation!
    
    public func dismiss(transitionContext:UIViewControllerContextTransitioning){
        guard let popDel = popDelegate,let index = popDelegate?.indexOfPopViewImageView(),let toFrame = pushDelegate?.imageViewRectOfAnimatorStart(at: index) else {
            return
        }
        let containerView = transitionContext.containerView
        let tempImgView = UIImageView()
        tempImgView.image = popDel.imageViewOfPopView().image
        tempImgView.frame = popDel.imageViewOfPopView().frame
        
        tempImgView.layer.masksToBounds = true
        tempImgView.contentMode = .scaleAspectFill
        containerView.addSubview(tempImgView)
        
        UIView.animate(withDuration: transitionDuration(using: transitionContext), animations: {
            tempImgView.frame = toFrame
        }) { (finish:Bool) in
            transitionContext.completeTransition(true)
        }
        
    }
    
    public func popAnimator(transitionContext:UIViewControllerContextTransitioning,isPop:Bool){
        guard let toViewController = transitonContext.viewController(forKey: UITransitionContextViewControllerKey.to) , let popDel = popDelegate,let index = popDelegate?.indexOfPopViewImageView(),let toFrame = pushDelegate?.imageViewRectOfAnimatorStart(at: index) else {
            return
        }
        
        let containerview = transitonContext.containerView
        if isPop {
            toViewController.view.alpha = 0
            containerview.addSubview(toViewController.view)
        }else{
            let dismissView = transitonContext.view(forKey: UITransitionContextViewKey.from)
            dismissView?.removeFromSuperview()
        }
        
        let tempImageView = UIImageView()
        tempImageView.image = popDel.imageViewOfPopView().image
        tempImageView.frame = popDel.imageViewOfPopView().frame
        tempImageView.layer.masksToBounds = true
        tempImageView.contentMode = .scaleAspectFill
        containerview.addSubview(tempImageView)
        
        UIView.animate(withDuration: transitionDuration(using: transitionContext), animations: {
            
            tempImageView.frame = toFrame
            if isPop == true{// pop时的处理
                toViewController.view.alpha = 1.0
            }
            
        }) { (finished: Bool) in
            if isPop{// pop时的处理
                tempImageView.removeFromSuperview()
            }
            //告诉上下文动画完成
            transitionContext.completeTransition(true)
        }
    }
    
    public func pushAnimator(transitionContext: UIViewControllerContextTransitioning) {
        guard let toViewController = transitionContext.viewController(forKey: UITransitionContextViewControllerKey.to) , let pushDel = pushDelegate,let indexPath = selIndex else {
            return
        }
        let containerView = transitionContext.containerView
        
        let backgroundView = UIView.init(frame: containerView.bounds)
        backgroundView.backgroundColor = UIColor.black
        
        let tempImageView = pushDel.imageView(at: indexPath)
        
        backgroundView.addSubview(tempImageView)
        containerView.addSubview(toViewController.view)
        containerView.addSubview(backgroundView)
        
        tempImageView.frame = pushDel.imageViewRectOfAnimatorStart(at: indexPath)
        
        UIView.animate(withDuration: transitionDuration(using: transitionContext), delay: 0, options: UIView.AnimationOptions.curveEaseInOut, animations: {
            tempImageView.frame = pushDel.imageViewRectOfAnimatorEnd(at: indexPath)
            
        },completion: { finished in
            
            backgroundView.removeFromSuperview()
            
            transitionContext.completeTransition(true)
        })
    }
    
    
}




extension LCPhotoBrowserAnimator:UIViewControllerTransitioningDelegate,UIViewControllerAnimatedTransitioning{
    public func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 0.3
    }
    
    public func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        isPresent = true
        return self
    }
    
    public func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        isPresent = false
        return self
    }
    
    public func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        
        if  transitionType == .navigation {
            
            if operation == UINavigationController.Operation.pop{
                popAnimator(transitionContext: transitionContext, isPop: true)
            }else{
                pushAnimator(transitionContext: transitionContext)
            }
            
        }else{
            if isPresent{
                pushAnimator(transitionContext: transitionContext)
            }else{
                popAnimator(transitionContext: transitionContext, isPop: false)
            }
        }
        
    }
    
    
}

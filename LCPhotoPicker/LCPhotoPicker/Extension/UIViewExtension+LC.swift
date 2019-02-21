//
//  UIViewExtension+LC.swift
//  LCPhotoPicker
//
//  Created by ucf-y on 2019/1/29.
//  Copyright © 2019 ucf-y. All rights reserved.
//

import UIKit

extension UIView{
    @IBInspectable var cornerRadius:CGFloat{
        get{
            return layer.cornerRadius
        }
        set{
            layer.cornerRadius = newValue
        }
    }
    
    @IBInspectable var maskToBounds:Bool{
        get{
            return layer.masksToBounds
        }
        set{
            layer.masksToBounds = newValue
        }
    }
    
    @IBInspectable var borderColor:UIColor{
        get{
            return UIColor.init(cgColor: layer.borderColor ?? UIColor.clear.cgColor)
        }
        set{
            layer.borderColor = newValue.cgColor
        }
    }
    
    @IBInspectable var borderWidth:CGFloat{
        get{
            return layer.borderWidth
        }
        set{
            layer.borderWidth = newValue
        }
    }
}


public extension UIViewController{
    //    public func hePresentPhotoPickerController(picker:LCBaseViewController,animate:Bool){
    //        let nav = UINavigationController.init(rootViewController: picker)
    //        present(nav, animated: animate, completion: nil)
    //    }
}

//
//  LCPhotoPickerCell.swift
//  LCPhotoPicker
//
//  Created by ucf-y on 2019/1/29.
//  Copyright © 2019 ucf-y. All rights reserved.
//

import UIKit

typealias LCPhotoPickerCellClosuer = (_ btn:UIButton) -> Void
typealias LCPhotoPickerellAlert = () -> Void

class LCPhotoPickerCell: UICollectionViewCell {
    
    var imageView:UIImageView!
    var checkBtn:UIButton!
    var topView:UIView!
    var durationLab:UILabel!
    var durationBackView:UIView!
    var maskLayer:CAGradientLayer!
    
    var checkBtnClickClosure:LCPhotoPickerCellClosuer?
    var topViewClickBlock:LCPhotoPickerellAlert?
    
    var representedAssetIdentifier:String!
    
    var model : LCPhotoAsset!{
        didSet{
            
        }
    }
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = UIColor.gray
        
        imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        contentView.addSubview(imageView)
        
        checkBtn = UIButton.init(type:.custom)
        let bundle = LCTool.bundle
        
        let selImg = UIImage.init(named: "btn-check-selected", in: bundle, compatibleWith: nil)
        let norImg = UIImage.init(named: "btn-check-normal", in: bundle, compatibleWith: nil)
        checkBtn.setImage(selImg, for: .selected)
        checkBtn.setImage(norImg, for: .normal)
        checkBtn.addTarget(self, action: #selector(selectedBtnClick(_:)), for: .touchUpInside)
        
        topView = UIView()
        topView.isHidden = true
        topView.backgroundColor = UIColor.init(r: 255, g: 255, b:255, a: 0.6)
        let tap = UITapGestureRecognizer.init(target: self, action: #selector(topViewClick))
        contentView.addSubview(topView)
        topView.addGestureRecognizer(tap)
        
        
        durationBackView = UIView()
        durationBackView.backgroundColor = UIColor.clear
        durationBackView.isHidden = true
        contentView.addSubview(durationBackView)
        
        maskLayer = CAGradientLayer.init()
        maskLayer.startPoint = CGPoint.init(x: 0, y: 0)
        maskLayer.endPoint = CGPoint.init(x: 0, y: 1)
        maskLayer.locations = [0,1]
        maskLayer.borderWidth = 0
        durationBackView.layer.addSublayer(maskLayer)
        
        durationLab = UILabel()
        durationLab.font = UIFont.systemFont(ofSize: 10)
        durationLab.textColor = UIColor.white
        
        durationBackView.addSubview(durationLab)
    }
    
    
    override func layoutSubviews() {
        super.layoutSubviews()
        imageView.frame = self.bounds
        let btnW : CGFloat = 25
        checkBtn.frame = CGRect.init(x: self.bounds.width - 3 - btnW, y: 3, width: btnW, height: btnW)
        topView.frame = contentView.bounds
        let durationBackViewH = CGFloat(20)
        durationBackView.frame = CGRect.init(x: 0, y: self.bounds.height - durationBackViewH, width: self.bounds.width, height: durationBackViewH)
        durationLab.sizeToFit()
        durationLab.frame = CGRect.init(x: durationBackView.bounds.width - durationLab.bounds.width - 5, y: (durationBackViewH - durationLab.bounds.height)/2.0, width: durationLab.bounds.width, height: durationLab.bounds.height)
        maskLayer.frame = self.durationBackView.bounds
    }
   @objc func topViewClick() -> Void {
        
    }
    
    @objc func selectedBtnClick(_ btn:UIButton) -> Void {
        btn.isSelected = !btn.isSelected
        
    }
    
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

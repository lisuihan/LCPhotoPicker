//
//  LCPhotoBrowserBotttomCell.swift
//  LCPhotoPicker
//
//  Created by ucf-y on 2019/2/14.
//  Copyright © 2019 ucf-y. All rights reserved.
//

import UIKit
import Photos

class LCPhotoBrowserBotttomCell: UICollectionViewCell {
    
    private var checkBtnClickClosure:LCPhotoPickerCellClosuer?
    
    var model:LCPhotoAsset!{
        didSet{
            let scale = UIScreen.main.scale / 2
            let thumbnailSize = CGSize(width: self.bounds.size.width * scale, height: self.bounds.size.height * scale)
            PHCachingImageManager.default().requestImage(for: model.asset, targetSize: thumbnailSize, contentMode: .aspectFill, options: nil) { (image, nil) in
                self.imageView.image = image
            }
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
 
    lazy var imageView : UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.backgroundColor = UIColor.black
        return imageView
    }()
    
    override var isSelected: Bool{
        didSet{
            if isSelected {
                self.layer.borderWidth = 2
                self.layer.borderColor = UIColor.themeYellow.cgColor
            }else{
                self.layer.borderWidth = 0
            }
        }
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}

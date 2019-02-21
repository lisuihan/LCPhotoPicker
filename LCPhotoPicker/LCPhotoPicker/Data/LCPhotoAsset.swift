//
//  LCPhotoAsset.swift
//  LCPhotoPicker
//
//  Created by ucf-y on 2019/1/29.
//  Copyright © 2019 ucf-y. All rights reserved.
//

import UIKit
import Photos

public class LCPhotoAsset: NSObject {
    
    /// 是否选中
    public  var isSelected = false
    /// 是否显示可选按钮
    public var isEnableSelected = true
    /// 是否可点击
    public  var isEnable = true
    //图片集合
    public var asset = PHAsset()
    
    public var index : Int = 0
    
    public override init() {
        super.init()
    }
    
    public init(asset:PHAsset){
        self.asset = asset
    }
}

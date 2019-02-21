//
//  LCPickerOptions.swift
//  LCPhotoPicker
//
//  Created by ucf-y on 2019/1/29.
//  Copyright © 2019 ucf-y. All rights reserved.
//

import UIKit

public enum LCMediaType: Int{
    case image
    case video
    case imageAndVideo
    case imageOrVideo
}

class LCPickerOptions: NSObject {
    /// 要挑选的数据类型
    public var mediaType : LCMediaType = .imageAndVideo
    /// 列表是否按创建时间升序排列
    public var ascendingOfCreationDateSort : Bool = false
    /// 挑选图片的最大个数
    public var maxCountOfImage = 9
    /// 挑选视频的最大个数
    public var maxCountOfVideo = 2
    /// 是否支持图片单选，默认是false，如果是ture只允许选择一张图片（如果 mediaType = imageAndVideo 或者 imageOrVideo 此属性无效）
    public var singlePicture = false
    /// 是否支持视频单选 默认是false，如果是ture只允许选择一个视频（如果 mediaType = imageAndVideo 此属性无效）
    public var singleVideo = false
    
    public var defaultSelections: [LCPhotoAsset]?
}

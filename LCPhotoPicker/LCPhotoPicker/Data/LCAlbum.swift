//
//  LCAlbum.swift
//  LCPhotoPicker
//
//  Created by ucf-y on 2019/1/29.
//  Copyright © 2019 ucf-y. All rights reserved.
//

import UIKit
import Photos


class LCAlbum: NSObject {
  
    //相册里面的数据
    var fetchReuslt:PHFetchResult<PHAsset>!
   //相册封面
    var albumCover:PHAsset?
    //相册标题
    var title:String?
    var count:Int!
    
    init(result:PHFetchResult<PHAsset>,title:String?) {
        self.title = title
        fetchReuslt = result
        count = fetchReuslt.count
        if  fetchReuslt.count > 0 {
            albumCover = fetchReuslt.firstObject
        }
    }
}

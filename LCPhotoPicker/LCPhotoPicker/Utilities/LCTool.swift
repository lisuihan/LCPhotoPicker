//
//  LCTool.swift
//  LCPhotoPicker
//
//  Created by ucf-y on 2019/1/29.
//  Copyright © 2019 ucf-y. All rights reserved.
//

import UIKit

//屏宽
let kScreenWidth = UIScreen.main.bounds.size.width
//屏高
let kScreenHeight = UIScreen.main.bounds.size.height

class LCTool: NSObject {

    public static var bundle:Bundle?{
        get{
            guard let url = Bundle.init(for: LCTool.self).url(forResource: "LCPhotoPicker", withExtension: "bundle") else{
                return nil
            }
            return Bundle.init(url: url)
        }
    }
    
    public static func isiPhoneX() -> Bool{
        if kScreenHeight == 812 {
            return true
        }else {
            return false
        }
    }
    
    public static func presentAlert(title:String,viewController:UIViewController){
        let title = title
        let alertView = UIAlertController.init(title: "提示", message: title, preferredStyle: .alert)
        let okAction = UIAlertAction.init(title:"确定", style: .default) { okAction in }
        alertView.addAction(okAction)
        viewController.present(alertView, animated: true, completion: nil)
    }
}

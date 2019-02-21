//
//  UIColorExtension+LC.swift
//  LCPhotoPicker
//
//  Created by ucf-y on 2019/1/29.
//  Copyright © 2019 ucf-y. All rights reserved.
//

import UIKit

extension UIColor{
    class var background:UIColor {
        return UIColor.init(red: 242, green: 242, blue: 242, alpha: 1)
    }
    
    public class var themeYellow:UIColor{
        return UIColor.init(red: 219, green: 147, blue: 79, alpha: 1)
    }
}


extension UIColor{
    public convenience  init(r:UInt32, g:UInt32, b:UInt32, a:CGFloat = 1.0) {
        self.init(red: CGFloat(r)/255.0, green: CGFloat(g)/255.0, blue: CGFloat(b)/255.0, alpha: a)
    }
    
    public class var random:UIColor{
        return UIColor.init(r: arc4random_uniform(256), g: arc4random_uniform(256), b: arc4random_uniform(256))
    }
    
    public func image() -> UIImage{
        let rect = CGRect.init(x: 0, y: 0, width: 1, height: 1)
        UIGraphicsBeginImageContext(rect.size)
        let context = UIGraphicsGetCurrentContext()
        context?.setFillColor(self.cgColor)
        context?.fill(rect)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return image!
    }
    
    
    public class func hex(hexString:String) -> UIColor{
        var cString:String = hexString.trimmingCharacters(in: .whitespacesAndNewlines)
        if cString.count < 6 {return UIColor.black}
        
        let index = cString.index(cString.endIndex, offsetBy: -6)
        let subString = cString[index...]
        if cString.hasPrefix("0X") { cString = String.init(subString) }
        if cString.hasPrefix("#") {cString = String.init(subString)}
        
        if cString.count != 6 { return UIColor.black }
        
        var range:NSRange = NSMakeRange(0, 2)
        let rString = (cString as NSString).substring(with: range)
        range.location = 2
        
        let gString = (cString as NSString).substring(with: range)
        range.location = 4
        
        let bString = (cString as NSString).substring(with: range)
        
        var r: UInt32 = 0x0
        var g: UInt32 = 0x0
        var b: UInt32 = 0x0
        //提取值复制到r中并已0x0开头
        Scanner.init(string: rString).scanHexInt32(&r)
        Scanner.init(string: gString).scanHexInt32(&g)
        Scanner.init(string: bString).scanHexInt32(&b)
        
        return UIColor.init(r: r, g: g, b: b)
    }
}

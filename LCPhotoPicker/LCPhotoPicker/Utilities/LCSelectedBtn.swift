//
//  LCSelectedBtn.swift
//  LCPhotoPicker
//
//  Created by ucf-y on 2019/1/29.
//  Copyright © 2019 ucf-y. All rights reserved.
//

import UIKit

class LCSelectedBtn: UIButton {

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        layer.cornerRadius = 4
        layer.masksToBounds = true
        
        setBackgroundImage(UIColor.hex(hexString: "#E98F36").image(), for: .normal)
        setBackgroundImage(UIColor.hex(hexString: "#EEEEEE").image(), for: .disabled)
        
        setTitleColor(UIColor.hex(hexString: "#FFFFFF"), for: .normal)
        setTitleColor(UIColor.hex(hexString: "#666666"), for: .disabled)
        
        contentEdgeInsets = UIEdgeInsets.init(top: 5, left: 10, bottom: 5, right: 10)
        titleLabel?.font = UIFont.systemFont(ofSize: 14)
    }
    
    func setTitle(_ title:String){
         setTitle(title, for: .normal)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

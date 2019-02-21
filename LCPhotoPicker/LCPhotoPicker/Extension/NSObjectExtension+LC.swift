//
//  NSObjectExtension+LC.swift
//  LCPhotoPicker
//
//  Created by ucf-y on 2019/1/28.
//  Copyright © 2019 ucf-y. All rights reserved.
//

import Foundation

extension NSObject{
    public var className:String {
        return type(of: self).className
    }
    
    public static var className:String {
        return String.init(describing: self)
    }
}


extension Sequence{
    
    func count(where predicate:(Element) throws -> Bool) rethrows -> Int {
        var count = 0
        for element in self {
            if try predicate(element){
                count += 1
            }
        }
        return count
    }
}


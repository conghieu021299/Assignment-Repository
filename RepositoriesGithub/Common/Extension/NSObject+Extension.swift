//
//  NSObject+Extension.swift
//  SoccerResults
//
//  Created by Anh Tu on 3/2/17.
//  Copyright © 2017 . All rights reserved.
//

import UIKit

extension NSObject {
    static var className: String {
        return String(describing: self)
    }
    
    // For Instance of class get name
    var className: String {
        return String(describing: type(of: self))
    }
    
    static var getNib: UINib {
        return UINib(nibName: self.className, bundle: nil)
    }
    
}

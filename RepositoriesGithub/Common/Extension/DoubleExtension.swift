//
//  DoubleExtension.swift
//  NextCRM
//
//  Created by hosco on 12/23/19.
//  Copyright © 2019 Anh Tu. All rights reserved.
//

import UIKit

extension Double {
    
    var toString: String {
        get {
            let formatter = NumberFormatter()
            formatter.groupingSeparator = "."
            formatter.numberStyle = .decimal
            return formatter.string(for: self) ?? String(format: "%.0f", self)
        }
    }
}

extension Int {
    var toString: String {
        return Formatter.withSeparator.string(for: self) ?? ""
    }
}

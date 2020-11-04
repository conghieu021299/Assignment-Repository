//
//  FormatterExtension.swift
//  NextCRM
//
//  Created by hosco on 12/27/19.
//  Copyright © 2019 Anh Tu. All rights reserved.
//

import UIKit

extension Formatter {
    static let withSeparator: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.groupingSeparator = "."
        formatter.decimalSeparator = ","
        formatter.numberStyle = .decimal
        return formatter
    }()
}

//
//  Helper.swift
//  MasterPro
//
//  Created by anhtu on 5/22/19.
//  Copyright © 2019 hosco. All rights reserved.
//

import Foundation
import UIKit

func appDelegate () -> AppDelegate {
    return UIApplication.shared.delegate as! AppDelegate
}

// Define log function - start
func DEBUGLog(_ message: String,
              file: String = #file,
              line: Int = #line,
              function: String = #function) {
    #if DEBUG
    let fileURL = NSURL(fileURLWithPath: file)
    let fileName = fileURL.deletingPathExtension?.lastPathComponent ?? ""
//    print("DEBUG: \(Date().dblog()) \(fileName)::\(function)[L:\(line)] \(message)")
    print("DEBUG: \(fileName)::\(function)[L:\(line)] \(message)")
    #endif
    // Nothing to do if not debugging
}

func ERRORLog(_ message: String,
              file: String = #file,
              line: Int = #line,
              function: String = #function) {
    #if DEBUG
    let fileURL = NSURL(fileURLWithPath: file)
    let fileName = fileURL.deletingPathExtension?.lastPathComponent ?? ""
//    print("ERROR: \(Date().dblog()) \(fileName)::\(function)[L:\(line)] \(message)")
    print("ERROR: \(fileName)::\(function)[L:\(line)] \(message)")
    #endif
    // Nothing to do if not debugging
}

public func LS(_ key: String,
                 tableName: String? = nil,
                 bundle: Bundle = Bundle.main,
                 value: String = "",
                 comment: String = "") -> String {
    return NSLocalizedString(key, tableName: tableName, bundle: bundle, value: value, comment: value)
}

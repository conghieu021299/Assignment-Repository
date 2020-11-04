//
//  Utils.swift
//  MasterPro
//
//  Created by anhtu on 5/22/19.
//  Copyright © 2019 hosco. All rights reserved.
//

import Foundation
import UIKit

class Utils {
    
    static func bundleVersion() -> String {
        return Bundle.main.object(forInfoDictionaryKey: "CFBundleVersion") as! String
    }
    
    static func bundleVersionString() -> String {
        return Bundle.main.object(forInfoDictionaryKey: "CFBundleShortVersionString") as! String
    }
    
    static func checkVersionLessThan(_ currentVersion: String, _ storeVersion: String) -> Bool {
        if storeVersion.compare(currentVersion, options: .numeric) == .orderedDescending {
            return true
        }
        return false
    }
    
    /// Function open an url in browser
    ///
    /// - Parameter url: url will open.
    static func openURL(_ url: String) {
        if url.count == 0 {
            return
        }
        let urlOpen: URL = URL(string: url)!
        if #available(iOS 10.0, *) {
            UIApplication.shared.open(urlOpen, options: [:], completionHandler: nil)
        } else {
            // Fallback on earlier versions
            UIApplication.shared.openURL(urlOpen)
        }
    }
    
    static let today = Date()
    
    static func showAlert(controller: UIViewController?,
                          title: String? = nil, message: String? = nil,
                          nameBtnDismiss: String? = nil,
                          nameBtnAccept: String,
                          handler: (() -> Void)? = nil,
                          DissmissHandler handlerDiss: ((UIAlertAction) -> Void)? = nil) {
        let alertController = UIAlertController(title: title,
                                                message: message,
                                                preferredStyle: .alert)
        if nameBtnDismiss != nil {
            alertController.addAction(UIAlertAction(title: nameBtnDismiss, style: .cancel, handler: handlerDiss))
        }
        alertController.addAction(UIAlertAction(title: nameBtnAccept,
                                                style: .default, handler: {
                                                    alert -> Void in
                                                    if let completionHandler = handler {
                                                        completionHandler()
                                                    }
        }))
        controller?.present(alertController, animated: true, completion: nil)
    }
    
    // Show App Setting
    static func showAppSetting() {
        DispatchQueue.main.async {
            guard let settingsUrl = URL(string: UIApplication.openSettingsURLString) else { return }
            if UIApplication.shared.canOpenURL(settingsUrl) {
                UIApplication.shared.open(settingsUrl, completionHandler: { (success) in
                    // Checking for setting is opened or not
                    DEBUGLog("Setting is opened: \(success)")
                })
            }
        }
    }
    
    
    static func validateEmail(email: String) -> Bool {
        let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}"
        let emailTest = NSPredicate(format: "SELF MATCHES %@", emailRegex)
        return emailTest.evaluate(with:email)
    }
    
    static func isValidCustomer(customer: String) -> Bool {
        let customerRegEx = "[A-Za-z0-9]*"
        let validateCustomer = NSPredicate(format:"SELF MATCHES %@", customerRegEx)
        return validateCustomer.evaluate(with: customer)
    }
    
    static func validatePhone(email: String) -> Bool {
        let emailRegex = "[0-9]{10,13}"
        let emailTest = NSPredicate(format: "SELF MATCHES %@", emailRegex)
        return emailTest.evaluate(with:email)
    }
    
}



//MARK: Copy
protocol Copying {
    init(original: Self)
}

extension Copying {
    func clone() -> Self {
        let clazz = type(of: self)
        return clazz.init(original: self)
    }
}

extension Array where Element: Copying {
    func clone() -> Array {
        var copiedArray = Array<Element>()
        for element in self {
            copiedArray.append(element.clone())
        }
        return copiedArray
    }
}


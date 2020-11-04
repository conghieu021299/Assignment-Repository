//
//  UIViewExtension.swift
//  MasterPro
//
//  Created by Anh Tu on 9/26/19.
//  Copyright © 2019 Anh Tu. All rights reserved.
//

import UIKit

extension UIView {
    @IBInspectable var cornerRadius: Double {
        get {
            return Double(self.layer.cornerRadius)
        }
        set {
            self.layer.cornerRadius = CGFloat(newValue)
        }
    }
    
    func makeContraintToFullWithParentView() {
        guard let parrentView = self.superview else {
            return
        }
        let dict = ["view":self]
        self.translatesAutoresizingMaskIntoConstraints = false
        parrentView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[view]|", options: NSLayoutConstraint.FormatOptions(rawValue: 0), metrics: nil, views: dict))
        parrentView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[view]|", options: NSLayoutConstraint.FormatOptions(rawValue: 0), metrics: nil, views: dict))
    }
    
    func findParentViewController() -> UIViewController? {
        if let nextResponder = self.next as? UIViewController {
            return nextResponder
        } else if let nextResponder = self.next as? UIView {
            return nextResponder.findParentViewController()
        } else {
            return nil
        }
    }

}

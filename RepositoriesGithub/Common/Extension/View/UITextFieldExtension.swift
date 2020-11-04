//
//  UITextFieldExtension.swift
//  MasterPro
//
//  Created by Anh Tu on 9/26/19.
//  Copyright © 2019 Anh Tu. All rights reserved.
//

import UIKit

extension UITextField {
    func addWhiteBorder() -> Void {
        self.borderStyle = .none;
        self.layer.borderColor = UIColor.white.cgColor
        self.layer.borderWidth = 1
        self.layer.cornerRadius = 5
        self.clipsToBounds = true
        self.backgroundColor = UIColor.clear
        self.textColor = UIColor.white
        let leftView = UIView(frame: CGRect(x: 0, y: 0, width: 8.0, height: 30.0))
        
        self.leftView = leftView
        self.leftViewMode = .always
    }
    
    func addPlaceHolderText(placeholder: String) -> Void {
        self.attributedPlaceholder = NSAttributedString(string: placeholder,
                                                        attributes: [NSAttributedString.Key.foregroundColor: UIColor.white.withAlphaComponent(0.6), NSAttributedString.Key.font: UIFont.systemFont(ofSize: 14, weight: .ultraLight)])
    }
    
    func addBottomBorder(rgb: UInt, alpha: CGFloat = 1) {
        self.borderStyle = .none;
        let border = CALayer()
        let width = CGFloat(1.0)
        border.borderColor = UIColor(rgb: rgb).withAlphaComponent(alpha).cgColor
        border.frame = CGRect(x: 0, y: self.frame.size.height - width,   width:  self.frame.size.width, height: self.frame.size.height)
        border.borderWidth = width
        self.layer.addSublayer(border)
        self.layer.masksToBounds = true
    }
    
    func addLeftViewImage(image: UIImage) -> Void {
        let leftImage = UIImageView(image: image)
        let leftView = UIView(frame: CGRect(x: 0, y: 0, width: 44.0, height: 30.0))
        
        leftImage.contentMode = .center
        leftImage.center = CGPoint(x: leftView.frame.width / 2, y: leftView.frame.height / 2)
        leftView.addSubview(leftImage)
        //        leftView.backgroundColor = UIColor.cyan
        self.leftView = leftView
        self.leftViewMode = .always
    }
    
    func addRightImage(image: UIImage) -> Void {
        let leftImage = UIImageView(image: image)
        let leftView = UIView(frame: CGRect(x: 0, y: 0, width: 44.0, height: 30.0))
        
        leftImage.contentMode = .center
        leftImage.center = CGPoint(x: leftView.frame.width / 2, y: leftView.frame.height / 2)
        leftView.addSubview(leftImage)
        //        leftView.backgroundColor = UIColor.cyan
        self.rightView = leftView
        self.rightViewMode = .always
    }
    
    func addRightViewImage(image: UIImage,_ action: Selector,_ target: Any?) -> Void {
        let button = UIButton(type: .custom)
        button.frame = CGRect(x: 0, y: 0, width: self.bounds.height, height: self.bounds.height)
        button.setImage(image, for: .normal)
        button.addTarget(target, action: action, for: .touchUpInside)
        
        self.rightView = button
        self.rightViewMode = .always
    }
    
    func removeRightImage() {
        self.rightView = nil
        self.rightViewMode = .never
    }
}

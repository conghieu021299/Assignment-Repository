//
//  BaseInputViewController.swift
//
//  Created by Hieunc on 5/13/19.
//  Copyright © 2019 Hieunc. All rights reserved.
//

import UIKit

class BaseInputViewController: BaseViewController, UITextFieldDelegate {
    @IBOutlet weak var scrollView: UIScrollView!
//    @IBOutlet weak var contentViewHeightCons: NSLayoutConstraint!
    @IBInspectable var disableScroll: Bool = false
    
    private var activedTextField: UITextField?
    
    var heightShowKeyboard = 60
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addTapGestureInView()
//        if UIDevice.current.screenType == .iPhone4 {
//            disableScroll = false
//        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        registerKeyboardNotifications()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    func registerKeyboardNotifications() {
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(notification:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide(notification:)), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    @objc func keyboardWillShow(notification: NSNotification) {
//        let userInfo: NSDictionary = notification.userInfo! as NSDictionary
//        let keyboardInfo = userInfo[UIResponder.keyboardFrameBeginUserInfoKey] as! NSValue
//        let keyboardSize = keyboardInfo.cgRectValue.size
//        let contentInsets = UIEdgeInsets(top: 0, left: 0, bottom: keyboardSize.height + CGFloat(heightShowKeyboard), right: 0)
//        var aRect = self.view.frame
//        aRect.size.height -= keyboardSize.height
//        scrollView.contentInset = contentInsets
//        scrollView.scrollIndicatorInsets = contentInsets
//
//        if let textField = activedTextField {
//            if !aRect.contains(textField.frame.origin) {
//                scrollView.scrollRectToVisible(textField.frame, animated: true)
//            }
//        }
//        if disableScroll {
//            scrollView.isScrollEnabled = true
//        }
    }
    
    @objc func keyboardWillHide(notification: NSNotification) {
//        UIView.transition(with: scrollView, duration: 0.3, options: UIView.AnimationOptions.curveEaseOut, animations: {
//            let contentInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
//            self.scrollView.contentInset = contentInsets
//            self.scrollView.scrollIndicatorInsets = contentInsets
//            self.scrollView.setContentOffset(CGPoint.zero, animated: true)
//        }, completion: nil)
//        if disableScroll {
//            scrollView.isScrollEnabled = false
//        }
    }
    
    //MARK: - textField Delegate
    func textFieldDidBeginEditing(_ textField: UITextField) {
        textField.returnKeyType = .done
        activedTextField = textField
    }
    func textFieldDidEndEditing(_ textField: UITextField) {
        activedTextField = nil
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        let nextTag = textField.tag + 1
        if let nextResponder = textField.superview?.viewWithTag(nextTag) {
            if nextResponder.self is UIButton {
                textField.resignFirstResponder()
                nextOkButton()
            } else if nextResponder.self is UITextField {
                nextResponder .becomeFirstResponder()
            }
        }
        
        
        return true
    }
    
    func nextOkButton() -> Void {
        print("ok ok")
    }
    
}

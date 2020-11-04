//
//  PaddingTextField.swift
//  NextCRM
//
//  Created by hosco on 12/19/19.
//  Copyright © 2019 Anh Tu. All rights reserved.
//

import UIKit

class PaddingTextField: UITextField {

    let padding = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
    
    required init?(coder aDecoder: NSCoder) {
      super.init(coder: aDecoder)
    }
    
    override func textRect(forBounds bounds: CGRect) -> CGRect {
      return bounds.inset(by: padding)
    }
    
    override func placeholderRect(forBounds bounds: CGRect) -> CGRect {
      return bounds.inset(by: padding)
    }
    
    override func editingRect(forBounds bounds: CGRect) -> CGRect {
      return bounds.inset(by: padding)
    }

}

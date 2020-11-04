//
//  SVProgressHUD.swift
//  CiPPo
//
//  Created by ntq on 12/7/18.
//  Copyright © 2018 ntq. All rights reserved.
//

import UIKit
import SVProgressHUD

class ProgressHUD: SVProgressHUD {
    
    private(set) static var isShowing = false
    
    static func showProgress()  {
        guard !isShowing else { return }
        isShowing = true
        SVProgressHUD.show()
    }
    
    static func hideProgress() {
        guard isShowing else { return }
        //        DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
        SVProgressHUD.dismiss()
        isShowing = false
        //        }
    }
    
}

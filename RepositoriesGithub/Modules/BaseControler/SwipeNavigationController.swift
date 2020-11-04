//
//  SwipeNavigationController.swift
//  https://stackoverflow.com/questions/34942571/how-to-enable-back-left-swipe-gesture-in-uinavigationcontroller-after-setting-le
//  Created by Hieunc on 5/13/19.
//  Copyright © 2019 Hieunc. All rights reserved.
//

import UIKit

class SwipeNavigationController: UINavigationController {
    // MARK: - Lifecycle
    
    
    override init(rootViewController: UIViewController) {
        super.init(rootViewController: rootViewController)
    }
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        
        delegate = self
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationBar.isTranslucent = false
        // This needs to be in here, not in init
        interactivePopGestureRecognizer?.delegate = self
    }
    
    deinit {
        delegate = nil
        interactivePopGestureRecognizer?.delegate = nil
    }
    
    // MARK: - Overrides
    
    override func pushViewController(_ viewController: UIViewController, animated: Bool) {
        duringPushAnimation = true
        
        super.pushViewController(viewController, animated: animated)
    }
    
    // MARK: - Private Properties
    
    fileprivate var duringPushAnimation = false
    
    // MARK: - Unsupported Initializers
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        delegate = self
    }
}

// MARK: - UINavigationControllerDelegate

extension SwipeNavigationController: UINavigationControllerDelegate {
    
    func navigationController(_ navigationController: UINavigationController, didShow viewController: UIViewController, animated: Bool) {
        guard let swipeNavigationController = navigationController as? SwipeNavigationController else { return }
        if let baseVC = viewController as? BaseViewController {
            if baseVC.isEnableSwipe {
                swipeNavigationController.duringPushAnimation = false
            } else {
                swipeNavigationController.duringPushAnimation = true
            }
        } else {
            swipeNavigationController.duringPushAnimation = false
        }
        
    }
    
}

// MARK: - UIGestureRecognizerDelegate

extension SwipeNavigationController: UIGestureRecognizerDelegate {
    
    func gestureRecognizerShouldBegin(_ gestureRecognizer: UIGestureRecognizer) -> Bool {
        guard gestureRecognizer == interactivePopGestureRecognizer else {
            return true // default value
        }
        
        // Disable pop gesture in two situations:
        // 1) when the pop animation is in progress
        // 2) when user swipes quickly a couple of times and animations don't have time to be performed
        return viewControllers.count > 1 && duringPushAnimation == false
    }
}


//
//  BaseViewController.swift
//
//  Created by Hieunc on 5/13/19.
//  Copyright © 2019 Hieunc. All rights reserved.
//

import UIKit

enum NaviButtonType: Int {
    case back, menu
}

class BaseViewController: UIViewController {

    var isEnableSwipe = true
//    let currencyFormatter = NumberFormatter()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.barTintColor = UIColor.black
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key(rawValue: NSAttributedString.Key.foregroundColor.rawValue): UIColor.white]
        DEBUGLog("\(self.className) has been created!")
//        createNotificationButton()
        registerNotification()
    }
    
//    override func viewWillAppear(_ animated: Bool) {
//        super.viewWillAppear(animated)
//        NotificationManager.share.updateBadgeButton()
//    }
    
    func registerNotification() -> Void {
        
    }
    
//    func makeToastMessage(message: String?) -> Void {
//        if message == nil { return }
//        self.view.makeToast(message)
//    }
    
    deinit {
        DEBUGLog("\(self.className) has been released!")
    }
    
    func creatNaviButton(types: NaviButtonType...) {
        if types.count > 0 {
            for type in types {
                switch type {
                case .back:
                    creatBackButton()
                case .menu:
                    creatBackButton()
                }
            }
        }
    }
    
//    func formatMoney(){
//        //MARK: Format Label Money
//        currencyFormatter.usesGroupingSeparator = true
//        currencyFormatter.numberStyle = .currency
//        // localize to your grouping and decimal separator
//        currencyFormatter.locale = Locale(identifier: "es_vn")
//    }
//
//    func onFormatMoneyInt(value: Int) -> String {
//        let priceString = currencyFormatter.string(from: value as NSNumber)!
//        let subString = priceString.prefix(priceString.count - 2)
//        return String(subString)
//    }
//
//    func onFormatMoneyDouble(value: Double) -> String {
//        let priceString = currencyFormatter.string(from: value as NSNumber)!
////        let subString = priceString.prefix(priceString.count - 2)
//        return String(priceString)
//    }
    
    private func creatBackButton() {
        let image = UIImage(named: "ic_back_white")?.withRenderingMode(.alwaysOriginal)
        let backBtn = UIBarButtonItem(image: image, style: UIBarButtonItem.Style.plain, target: self, action: #selector(self.popViewController))
        self.navigationItem.leftBarButtonItem = backBtn
    }
    
    func createButton(imageName: String, selector: Selector, isLeft: Bool) {
        let button = UIBarButtonItem(image: UIImage(named: imageName)?.withRenderingMode(.alwaysOriginal), style: .plain, target: self, action: selector)
        if isLeft {
            navigationItem.leftBarButtonItem = button
        } else {
            navigationItem.rightBarButtonItem = button
        }
    }
    
    func createButtonString(titleStr: String, selector: Selector, isLeft: Bool) {
        let button = UIBarButtonItem(title: titleStr, style: .plain, target: self, action: selector)
        button.tintColor = UIColor.white
        if isLeft {
            navigationItem.leftBarButtonItem = button
        } else {
            navigationItem.rightBarButtonItem = button
        }
    }
    
    @objc func popViewController() {
        self.navigationController?.popViewController(animated: true)
    }
    
    func removeNavigationButton() -> Void {
        navigationItem.rightBarButtonItem = nil
    }
    
//    func createNotificationButton() -> Void {
//        navigationItem.rightBarButtonItem = notificationButton()
//    }
    
//    func createCustomRightAndNoti(_ rightBtn: UIBarButtonItem) -> Void {
//        self.navigationItem.rightBarButtonItems = [notificationButton(), rightBtn]
//    }
    
    @objc func onNotificationTouch(_ sender: Any) {
//        let notiList = NotificationListViewController(nibName: NotificationListViewController.className, bundle: nil)
//        self.navigationController?.pushViewController(notiList, animated: true)
    }
    
//    private func notificationButton() -> UIBarButtonItem {
//        let image = UIImage(named: "ic_bell_white")?.withRenderingMode(.alwaysOriginal)
//        let badgeBtn = BadgeButton(frame: CGRect(x: 0, y: 0, width: 32, height: 44))
//        badgeBtn.setImage(image, for: .normal)
//        badgeBtn.setTitle("", for: .normal)
//        badgeBtn.badgeBackgroundColor = ColorConst.appActive.getUIColor()
//        badgeBtn.badge = String(NotificationManager.share.numberNoti)
//        badgeBtn.addTarget(self, action: #selector(onNotificationTouch(_:)), for: .touchUpInside)
//        let notiButton = UIBarButtonItem(customView: badgeBtn)
//        //        let notiButton = UIBarButtonItem(image: UIImage(named: "ic_bell_white")?.withRenderingMode(.alwaysOriginal), style: .plain, target: self, action: #selector(onNotificationTouch(_:)))
//        return notiButton
//    }
    
    func showPopupStr(_ textValue: String, textTitle: String) {
//        let popupVC = PopupStringViewController(nibName: PopupStringViewController.className, bundle: nil)
//        popupVC.valueStr = textValue
//        popupVC.valueTitle = textTitle
//        popupVC.modalPresentationStyle = .overFullScreen
//        self.present(popupVC, animated: false, completion: nil)
    }

}

extension BaseViewController {
    func safeAreaBottomHeight() -> CGFloat {
        var bottomPadding: CGFloat = 0
        if #available(iOS 11, *) {
            bottomPadding = UIApplication.shared.keyWindow?.safeAreaInsets.bottom ?? 0
        }
        return bottomPadding
    }
    
    func setScrollViewContenInset(scrollView: UIScrollView) -> Void {
        //do ở IOS 11 cái contenInset này nó tự tụt xuống một đoạn cho con IPX nên phải set lại chỗ này :shame:
        if #available(iOS 11, *) {
            scrollView.contentInsetAdjustmentBehavior = .never
        } else {
            self.automaticallyAdjustsScrollViewInsets = false
        }
    }
    
}

//MARK: - Tap In View
extension BaseViewController {//: UIGestureRecognizerDelegate {
    func addTapGestureInView() -> Void {
        let tap = UITapGestureRecognizer(target: self, action: #selector(tapinView(notification:)))
        tap.cancelsTouchesInView = false
//        tap.delegate = self
        self.view.addGestureRecognizer(tap)
    }
    
    @objc func tapinView(notification: NSNotification) -> Void {
        self.view.endEditing(true)
    }
    
//    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldReceive touch: UITouch) -> Bool {
//        if let _ = touch.view as? UIButton {
//            return false
//        }
//        return true
//    }
}



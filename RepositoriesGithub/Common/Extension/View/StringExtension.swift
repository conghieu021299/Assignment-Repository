//
//  StringExtension.swift
//  MasterPro
//
//  Created by Anh Tu on 9/26/19.
//  Copyright © 2019 Anh Tu. All rights reserved.
//

import UIKit

extension String {
    func height(withConstrainedWidth width: CGFloat, font: UIFont) -> CGFloat {
        let constraintRect = CGSize(width: width, height: .greatestFiniteMagnitude)
        let boundingBox = self.boundingRect(with: constraintRect, options: .usesLineFragmentOrigin, attributes: [NSAttributedString.Key.font: font], context: nil)
        
        return ceil(boundingBox.height)
    }
    
    func width(withConstraintedHeight height: CGFloat, font: UIFont) -> CGFloat {
        let constraintRect = CGSize(width: .greatestFiniteMagnitude, height: height)
        let boundingBox = self.boundingRect(with: constraintRect, options: .usesLineFragmentOrigin, attributes: [NSAttributedString.Key.font: font], context: nil)
        
        return ceil(boundingBox.width)
    }
    
    func subString(startIndex: Int, endIndex: Int) -> String {
        let end = (endIndex - self.count) + 1
        let indexStartOfText = self.index(self.startIndex, offsetBy: startIndex)
        let indexEndOfText = self.index(self.endIndex, offsetBy: end)
        let substring = self[indexStartOfText..<indexEndOfText]
        return String(substring)
    }
    
    func utf8DecodedString()-> String {
        let data = self.data(using: .utf8)
        if let message = String(data: data!, encoding: .nonLossyASCII){
            return message
        }
        return self
    }
    
    func utf8EncodedString()-> String {
        let messageData = self.data(using: .nonLossyASCII)
        if let text = String(data: messageData!, encoding: .utf8) {
            return text
        }
        return self
    }
    
//    var localized: String {
//        let path = Bundle.main.path(forResource: LanguageManager.share.language, ofType: "lproj")
//        let bundle = Bundle(path: path!)
//
//        return NSLocalizedString(self, tableName: nil, bundle: bundle!, value: "", comment: "")
////        return NSLocalizedString(self, comment: "")
//    }
    
    func toDateUTC(_ formart: String) -> Date? {
        let dateFormat = DateFormatter()
        dateFormat.dateFormat = formart
        dateFormat.timeZone = TimeZone(abbreviation: "UTC")
        return dateFormat.date(from: self)
    }
    
    func toDateCurrentZone(_ formart: String) -> Date? {
        let dateFormat = DateFormatter()
        dateFormat.dateFormat = formart
        dateFormat.timeZone = TimeZone.current
        return dateFormat.date(from: self)
    }
    
    func unicodeString() -> String {
        //        var newString = ""
        let unicode: String = self
        let standard: String = unicode.replacingOccurrences(of: "Đ", with: "D")
        let decode: Data? = standard.data(using: String.Encoding.ascii, allowLossyConversion: true)
        let ansi = String(data: decode!, encoding: String.Encoding.ascii)
        //        newString = (ansi as NSString?)?.substring(to: 1) ?? ""
        //        print("ANSI: \(ansi ?? "")/ \(newString)")
        //        print("ANSI: \(ansi ?? "")")
        return ansi ?? self
    }
    
}

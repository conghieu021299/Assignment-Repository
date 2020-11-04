//
//  Constant.swift
//  MasterPro
//
//  Created by anhtu on 5/22/19.
//  Copyright © 2019 hosco. All rights reserved.
//

import Foundation
import UIKit

//var UUID_KEYCHAIN: String {
//    let saveKey = String(format: "UUID_%@", const.PROJECT_NAME)
//    if let uuid = KeychainWrapper.standard.string(forKey: saveKey), uuid.count != 0 {
//        return uuid
//    } else {
//        if let uuid = UIDevice.current.identifierForVendor?.uuidString {
//            KeychainWrapper.standard.set(uuid, forKey: saveKey)
//            return uuid
//        }
//        return "No_UUID"
//    }
//}

struct const {
    static let PROJECT_NAME                 = "NhaKhoaSingae"
    static let saveLanguageKey      = "Singae_Language_Key"
    static let saveUserKey          = "Singae_User_Key"
    static let saveUserField        = "User_Field"
    static let saveUsername         = "User_Username"
}

struct dateConst {
    static let dateFormartServer            = "yyyy-MM-dd"
    static let dateFormartServer1            = "yyyy-MM-dd HH:mm:ss"
    static let dateFormartBirthday          = "dd-MM-yyyy"
    static let dateFormartType1             = "dd/MM/yyyy"
}

struct DayOfWeak {
    static let weekdays = [
        "CN",
        "T2",
        "T3",
        "T4",
        "T5",
        "T6",
        "T7"
    ]
}

struct Gender {
    static let male = 1
    static let feMale = 2
}

enum FillterType: Int, Codable {
    func encode(to encoder: Encoder) throws {
        
    }
    
    init(from decoder: Decoder) throws {
        try! self.init(from: decoder)
    }
    
    case branch
    case package
    case teacher
    case time
}

struct AppFormatters {
    static let debugConsoleDateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyyMMdd HH:mm:ss.SSS"
        formatter.timeZone = TimeZone(identifier: "UTC")!
        return formatter
    }()
    
    static let baseDateFormate = "HH:mm:ss"
    
    static let ISO8601                  = "yyyy-MM-dd'T'HH:mm:ss.SSSSSSZ"
    static let newsFormat               = "yyyy-MM-dd'T'HH:mm:ss.SSSSSS"
    static let mainFormat               = "yyyy-MM-dd'T'HH:mm:ss.SSSSS"
    static let timeSaleFormat           = "yyyy-MM-dd'T'HH:mm:ssZZZZZ"
    static let JPYMDWTimeFormat         = "yyyy年MM月dd日(EEEEE) HH:mm"
    static let dateTimeSale             = "配信期間yyyy.MM.dd HH:mmまで"
    static let convertSeverDateFormater = "yyyy-MM-dd'T'HH:mm:ssZ"
    static let timeSaleServerFormater   = "yyyy-MM-dd HH:mm:ss"
    static let JPShortWithTimeFormat    = "MM月dd日(EEEEE) HH:mm"
    static let fullFormat               = "dd/MM/yyyy HH:mm:ss"
    static let dateNews                 = "yyyy年MM月dd日 HH:mm"
    static let dateTimeFormat           = "dd/MM/yyyy HH:mm"
    static let dateTimeSaleCoupon       = "yyyy年MM月末口まで"
    static let JPShortYearFormat        = "yyyy年MM月dd日(E)"
    static let JPMDHS                   = "MM月dd日 HH:mm"
    static let dateRegisterFormat       = "yyyy年MM月dd日"
    static let tireImageDateFormat      = "yyyyMMddHHmm"
    static let dateDetailNews           = "MM月dd日昼刊"
    static let JPShortFormat            = "MM月dd日(E)"
    static let nomarlFormat             = "dd/MM/yyyy"
    static let dateSeverFormat          = "yyyy-MM-dd"
    static let dateSlashFormat          = "yyyy/MM/dd"
    static let shortFormat              = "yyyyMMdd"
    static let JPdateMonth              = "MM月dd日"
    static let dateMonth                = "MM/dd"
    static let hourMinuteFormat         = "HH:mm"
    static let JPDateMonthDay           = "MM/dd(E)"
}

// HTTP status code
enum ResultCode: Int, Codable {
    case httpSuccess = 200
    case httpCreated = 201
    case httpAccepted = 202
    case httpNoContent = 204
    case unknow = 999
    case httpInternalError = 500
    case httpBadRequest = 400
    case httpNotFound = 404
    case httpForbidden = 403
    case httpUnauthorized = 401
    case success = 1
    case error = 2
    case warning = 3
    case notFoundObj = 4
    case bodyInvalid = 5
    case paramInvalid = 6
    case noData = 7
    case codeExist = 20
    case emailExist = 21
    case phoneExist = 22
    case passwordWrong = 23
    case empApprovedOrder = 24
    case empBusy = 25
    case uploadError    = 11111
    
    var message: String {
        switch self {
        case .httpBadRequest, .httpNotFound:
            return "No Connection"
        default:
            return ""
        }
    }
    
    var isApiSuccess: Bool {
        return rawValue >= 200 && rawValue < 300
    }
}

struct Regex {
    static let emailRegEx    = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{1,}"
    static let phoneRegEx    = "^[0]{1}[1-9]{1}[0-9]{8,9}$" // VietName PhoneNumber
}

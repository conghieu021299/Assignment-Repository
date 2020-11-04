//
//  WKStringHasmac.swift
//  Waka
//
//  Created by Thao Nguyen on 3/2/17.
//  Copyright © 2017 VEGA Corp. All rights reserved.
//

import Foundation

enum HMACAlgorithm {
    case MD5, SHA1, SHA224, SHA256, SHA384, SHA512
    
//    func toCCHmacAlgorithm() -> CCHmacAlgorithm {
//        var result: Int = 0
//        switch self {
//        case .MD5:
//            result = kCCHmacAlgMD5
//        case .SHA1:
//            result = kCCHmacAlgSHA1
//        case .SHA224:
//            result = kCCHmacAlgSHA224
//        case .SHA256:
//            result = kCCHmacAlgSHA256
//        case .SHA384:
//            result = kCCHmacAlgSHA384
//        case .SHA512:
//            result = kCCHmacAlgSHA512
//        }
//        return CCHmacAlgorithm(result)
//    }
//
//    func digestLength() -> Int {
//        var result: CInt = 0
//        switch self {
//        case .MD5:
//            result = CC_MD5_DIGEST_LENGTH
//        case .SHA1:
//            result = CC_SHA1_DIGEST_LENGTH
//        case .SHA224:
//            result = CC_SHA224_DIGEST_LENGTH
//        case .SHA256:
//            result = CC_SHA256_DIGEST_LENGTH
//        case .SHA384:
//            result = CC_SHA384_DIGEST_LENGTH
//        case .SHA512:
//            result = CC_SHA512_DIGEST_LENGTH
//        }
//        return Int(result)
//    }
//}
//
//extension String {
//    func hmac(algorithm: HMACAlgorithm, key: String) -> String {
//        let cKey = key.cString(using: String.Encoding.utf8)
//        let cData = self.cString(using: String.Encoding.utf8)
//        var result = [CUnsignedChar](repeating: 0, count: Int(algorithm.digestLength()))
//        CCHmac(algorithm.toCCHmacAlgorithm(), cKey!, Int(strlen(cKey!)), cData!, Int(strlen(cData!)), &result)
//        let hmacData:NSData = NSData(bytes: result, length: (Int(algorithm.digestLength())))
//        let hmacBase64 = hmacData.base64EncodedString(options: NSData.Base64EncodingOptions.lineLength76Characters)
//        return String(hmacBase64)
//    }
//
//    func md5() -> String {
//
//        let context = UnsafeMutablePointer<CC_MD5_CTX>.allocate(capacity: 1)
//        var digest = Array<UInt8>(repeating:0, count:Int(CC_MD5_DIGEST_LENGTH))
//        CC_MD5_Init(context)
//        CC_MD5_Update(context, self, CC_LONG(self.lengthOfBytes(using: String.Encoding.utf8)))
//        CC_MD5_Final(&digest, context)
////        context.deallocate(capacity: 1)
//        context.deallocate()
//        var hexString = ""
//        for byte in digest {
//            hexString += String(format:"%02x", byte)
//        }
//
//        return hexString
//    }
    
    /// Encode a String to Base64
//    func toBase64() -> String {
//        return Data(self.utf8).base64EncodedString()
//    }
//    
//    /// Decode a String from Base64. Returns nil if unsuccessful.
//    func fromBase64() -> String? {
//        guard let data = Data(base64Encoded: self) else { return nil }
//        return String(data: data, encoding: .utf8)
//    }
}


//
//  APIRequest.swift
//
//  Created by Hieunc on 5/13/19.
//  Copyright © 2019 Hieunc. All rights reserved.
//

import UIKit
import Alamofire

class Connectivity {
    class var isConnectedToInternet: Bool {
        return NetworkReachabilityManager()!.isReachable
    }
}

class APIRequest {

    static let baseURLString = APIBase.BASE_URL

    @discardableResult
    static func request<M: Codable>(_ router: URLRequestConvertible,
                                    requiredToken: Bool = false,
                                    isSkipError: Bool = false,
                                    failure: ((ResponseError) -> Void)? = nil,
                                    completion: ((ResponseModel<M>?) -> Void)?) -> Request? {
        guard Connectivity.isConnectedToInternet else {
            DEBUGLog("--------Disconnect network--------")
            failure?(ResponseError(status: ResultCode(rawValue:999) ?? .unknow, message: "network error"))
            return nil
        }
        
//        let manager = Session.manager
//        if requiredToken, let token = SessionManager.shared.accountModel?.token {
//            let adapter = CPRequestAdapter(accessToken: token)
//            manager.adapter = adapter
//        } else {
//            let adapter = CPRequestAdapter(accessToken: nil)
//            manager.adapter = adapter
//        }
        return Session.request(router).responseJSON { (dataResponse) in
            if let error = dataResponse.error {
                if !isSkipError {
                    DEBUGLog(error.localizedDescription)
                    failure?(ResponseError(status: ResultCode(rawValue: dataResponse.response?.statusCode ?? 999) ?? .unknow, message: error.localizedDescription))
                    
                } else {
                    failure?(ResponseError(status: ResultCode(rawValue: dataResponse.response?.statusCode ?? 999) ?? .unknow, message: nil))
                }
                return
            }
            
            // Request failure
            if let httpStatusCode = dataResponse.response?.statusCode, (httpStatusCode >= 300 || httpStatusCode < 200) {
                // False
                // Process token Expired
                if !isSkipError {
                
                    failure?(ResponseError(status: ResultCode(rawValue: dataResponse.response?.statusCode ?? 999) ?? .unknow, message: "error"))
                    return
                }
                
                if httpStatusCode == ResultCode.httpUnauthorized.rawValue {
                    completion?(nil)
                    return
                }
            }

            // Response no data
            guard let data = dataResponse.data else {
                DEBUGLog("No Data")
                failure?(ResponseError(status: ResultCode(rawValue: dataResponse.response?.statusCode ?? 999) ?? .unknow, message: "nil data"))
                return
            }
//            if let utf8Text = String(data: data, encoding: .utf8) {
//                print("JSON: \(utf8Text)")
//            }
            // Process parse data
            do {
                let responseModel = try JSONDecoder().decode(ResponseModel<M>.self, from: data)
                completion?(responseModel)
//                if responseModel.data == nil {
//                    failure?(ResponseError(status: ResultCode(rawValue: dataResponse.response?.statusCode ?? 999) ?? .unknow, message: "nil data"))
//                } else {
//                    completion?(responseModel)
//                }
            }
            catch {
                DEBUGLog("PARSE ERROR: \(error)")
                failure?(ResponseError(status: ResultCode(rawValue: dataResponse.response?.statusCode ?? 999) ?? .unknow, message: "parse error"))
            }
        }
    }
}

extension APIRequest {
    @discardableResult
    static func requestPortal<M: Codable>(_ router: URLRequestConvertible, requiredToken: Bool = false,
                                    failure: ((ResponseError) -> Void)? = nil,
                                    completion: ((ResponsePortalModel<M>?) -> Void)?) -> Request? {
        guard Connectivity.isConnectedToInternet else {
            DEBUGLog("--------Disconnect network--------")
            failure?(ResponseError(status: ResultCode(rawValue:999) ?? .unknow, message: "network error"))
            return nil
        }
        
        return Session.request(router).responseJSON { (dataResponse) in
            if let error = dataResponse.error {
                DEBUGLog(error.localizedDescription)
                failure?(ResponseError(status: ResultCode(rawValue: dataResponse.response?.statusCode ?? 999) ?? .unknow, message: error.localizedDescription))
                return
            }
            
            // Request failure
            if let httpStatusCode = dataResponse.response?.statusCode, (httpStatusCode >= 300 || httpStatusCode < 200) {
                // False
                // Process token Expired
                if httpStatusCode == ResultCode.httpUnauthorized.rawValue {
                    completion?(nil)
                    return
                }
            }
            
            // Response no data
            guard let data = dataResponse.data else {
                DEBUGLog("No Data")
                failure?(ResponseError(status: ResultCode(rawValue: dataResponse.response?.statusCode ?? 999) ?? .unknow, message: "nil data"))
                return
            }
            
            // Process parse data
            do {
                let responseModel = try JSONDecoder().decode(ResponsePortalModel<M>.self, from: data)
                if responseModel.result == nil {
                    failure?(ResponseError(status: ResultCode(rawValue: dataResponse.response?.statusCode ?? 999) ?? .unknow, message: "nil data"))
                } else {
                    completion?(responseModel)
                }
            }
            catch {
                DEBUGLog("PARSE ERROR: \(error)")
                failure?(ResponseError(status: ResultCode(rawValue: dataResponse.response?.statusCode ?? 999) ?? .unknow, message: "parse error"))
            }
        }
    }
}

//MARK: - UploadImage
//extension APIRequest {
//    static func uploadImage<M: Codable>(_ imageData: Data, _ fileName: String?,_ failure: @escaping ((ResponseError) -> Void),  _ completion: @escaping (ResponseModel<M>?) -> Void) -> Void {
//        let urlUpload = baseURLString + APIPath.uploadImage as URLConvertible
//        var header = [String: String]()
//
//        if let user = LoginManager.shared.userLogin, let token = user.token {
//            header.updateValue("Bearer " + token, forKey: "Authorization")
//        }
//
//        Alamofire.upload(multipartFormData: { (multiPart) in
//            let name = fileName ?? ("avatar_" + String(Int64(Date().timeIntervalSince1970 * 1000)) + ".png")
//            multiPart.append(imageData, withName: "image_upload", fileName: name, mimeType: "image/jpeg")
//        }, to: urlUpload, method: .post, headers: header) { (result) in
//            switch result{
//            case .success(let upload, _, _):
//                upload.responseJSON(completionHandler: { (dataResponse) in
//                    if let error = dataResponse.error {
//                        print("error: \(error.localizedDescription)")
//                        failure(ResponseError(status: ResultCode(rawValue: dataResponse.response?.statusCode ?? 999) ?? .unknow, message: "error: \(error.localizedDescription)"))
//                        return
//                    }
//                    guard let data = dataResponse.data else {
//                        failure(ResponseError(status: ResultCode(rawValue: dataResponse.response?.statusCode ?? 999) ?? .unknow, message: "No Data"))
//                        return
//                    }
//                    if let utf8Text = String(data: data, encoding: .utf8) {
//                        print("JSON: \(utf8Text)")
//                    }
//                    do {
//                        let responseModel = try JSONDecoder().decode(ResponseModel<M>.self, from: data)
//                        completion(responseModel)
//                    } catch {
//                        failure(ResponseError(status: ResultCode(rawValue: dataResponse.response?.statusCode ?? 999) ?? .unknow, message: "PARSE ERROR: \(error)"))
//                    }
//
//                })
//            case .failure(let encodingError):
//                print(encodingError.localizedDescription)
//                failure(ResponseError(status: .uploadError, message: encodingError.localizedDescription))
//                break
//            }
//        }
//
//    }
//}

private struct CPRequestAdapter: RequestAdapter  {
    private var accessToken: String?
    private var refreshToken: String?

    init(accessToken: String? = nil) {
        self.accessToken = accessToken
    }

    func adapt(_ urlRequest: URLRequest) throws -> URLRequest {
        var urlRequest = urlRequest
        urlRequest.setValue("application/json", forHTTPHeaderField: "Accept")
        // urlRequest.setValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")
        
        guard let accessToken = accessToken else { return urlRequest }
        urlRequest.setValue("Bearer " + accessToken, forHTTPHeaderField: "Authorization")
        return urlRequest
    }
}

extension ResponseModel {
//    var errorMessage: String? {
//        return message ?? message_en
//    }
}

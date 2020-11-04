//
//  Router.swift
//
//  Created by Hieunc on 5/13/19.
//  Copyright © 2019 Hieunc. All rights reserved.
//

import UIKit
import Alamofire

enum Router: URLRequestConvertible {
    case getAllRepos(path: Parameters?)
    
    var result: (path: String, method: HTTPMethod, body: Parameters?, params: Parameters?, pathParams: [String]?)? {
        switch self {
        case .getAllRepos(let path):
            return (APIPath.getAllRepos, .get, nil, path, nil)
        }
    }
    
    //    var resultCodable: Data?  {
    //        switch self {
    //        case .updateUserCode( _, let bodyCodeable):
    //            return bodyCodeable
    //        default:
    //            return nil
    //        }
    //    }
    
    // MARK: URLRequestConvertible
    
    func asURLRequest() throws -> URLRequest {
        var url: URL =  try APIRequest.baseURLString.asURL()
        var urlRequest: URLRequest?
        if let result = self.result {
            url = url.appendingPathComponent(result.path)
            
            if let path = result.pathParams {
                for item in path {
                    url = url.appendingPathComponent(item)
                }
            }
            urlRequest = URLRequest(url: url)
            urlRequest!.httpMethod = result.method.rawValue
            
            urlRequest!.addValue("application/json", forHTTPHeaderField: "Content-Type")
//            if !url.absoluteString.contains(APIPath.login), let user = LoginManager.shared.userLogin, let token = user.token {
//                urlRequest!.addValue("Bearer " + token, forHTTPHeaderField: "Authorization")
//            }
            if let body = result.body {
                let bodyData = try JSONSerialization.data(withJSONObject: body, options: [])
                urlRequest!.httpBody = bodyData
            }
            if let params = result.params {
                let urlEncode = try URLEncoding.default.encode(urlRequest!, with: params)
                return urlEncode
            }
        }
        //        if let resultCodable = self.resultCodable {
        //            urlRequest!.httpBody = resultCodable
        //        }
        return urlRequest!
    }
}

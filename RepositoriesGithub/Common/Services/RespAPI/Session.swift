//
//  Session.swift
//
//  Created by Hieunc on 5/13/19.
//  Copyright © 2019 Hieunc. All rights reserved.
//

import UIKit
import Alamofire
import Foundation

let IntervalTimeOut: TimeInterval = 30

class Session {
    internal static var manager: Alamofire.SessionManager = {
        var configuration = URLSessionConfiguration.default
        configuration.timeoutIntervalForRequest = IntervalTimeOut
        let delegate = LoggingSessionDelegate()
        let sessionManager = Alamofire.SessionManager(configuration: configuration, delegate: delegate)
        return sessionManager
    }()
    
    class func request(_ url: URLRequestConvertible) -> DataRequest {
        return manager.request(url)
    }
    
    class func cancelAllRequest() {
        manager.session.invalidateAndCancel()
    }
    
    deinit {
        DEBUGLog("Session deinit")
    }
}

class LoggingSessionDelegate: Alamofire.SessionDelegate {
    
    override func urlSession(_ session: URLSession, dataTask: URLSessionDataTask, didReceive data: Data) {
        #if DEBUG
            logRequest(session, dataTask: dataTask, didReceiveData: data)
            logResponse(session, dataTask: dataTask, didReceiveData: data)
        #endif
        super.urlSession(session, dataTask: dataTask, didReceive: data)
    }
    fileprivate func logRequest(_ session: Foundation.URLSession, dataTask: URLSessionDataTask, didReceiveData data: Data) {
        DEBUGLog("---------------------------------------")
        DEBUGLog("Request: " + (dataTask.currentRequest?.url?.absoluteString ?? ""))
        let request = dataTask.currentRequest
        if let headers = request?.allHTTPHeaderFields {
            DEBUGLog("Request Headers: " + headers.description)
        }
        if let bodyStream = request?.httpBodyStream {
            let bodyString = String(data: Data(reading: bodyStream), encoding: .utf8) ?? ""
            DEBUGLog("Request Body: " + bodyString)
        }
        if let httpMethod = request?.httpMethod {
            DEBUGLog("HTTP Request Method:" + httpMethod)
        }
        DEBUGLog("---------------------------------------")
    }    
    fileprivate func logResponse(_ session: Foundation.URLSession, dataTask: URLSessionDataTask, didReceiveData data: Data) {
        do {
            DEBUGLog("---------------------------------------")
            let dataAsJSON = try JSONSerialization.jsonObject(with: data, options: [])
            let prettyData =  try JSONSerialization.data(withJSONObject: dataAsJSON, options: .prettyPrinted)
            if let jsonString = NSString(data: prettyData, encoding: String.Encoding.utf8.rawValue) {
                DEBUGLog("Response: \(jsonString)")
            }
            DEBUGLog("---------------------------------------")
        } catch {
            DEBUGLog("\(error)")
        }
    }
}

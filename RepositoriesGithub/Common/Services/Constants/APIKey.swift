//
//  APIKey.swift
//
//  Created by Hieunc on 5/13/19.
//  Copyright © 2019 Hieunc. All rights reserved.
//

import Foundation
typealias MParamater = [APIKey: Any]

class APIBase {
    static let BASE_URL                     = "https://api.github.com"
}

enum APIKey: String {
    case q
    case order
    case sort
    case per_page
    case page
}

extension Dictionary where Key == APIKey {
    var asParamater: [String: Any] {
        var param = [String: Any]()
        self.forEach { (key, value) in
            param[key.rawValue] = value
        }
        return param
    }
}

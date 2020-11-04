//
//  APIResponse.swift
//
//  Created by Hieunc on 5/13/19.
//  Copyright © 2019 Hieunc. All rights reserved.
//

import UIKit

struct VersionModel: Codable {
    var version: String?
}

struct ResultModel: Codable {
    var result: Bool?
}

struct ErrorModel: Codable {
    var meta: MetaModel?
}

struct ResponseModel<M: Codable>: Codable {
    var totalCount: Int?
    var items: M?
    
    private enum CodingKeys: String, CodingKey {
        case totalCount = "total_count"
        case items
    }
}

struct MetaModel: Codable {
    var status_code: Int?
    var message: String?
    var pagination: paginationModel?
}

struct paginationModel: Codable {
    var total: Int?
    var current_page: Int?
    var total_pages: Int?
    var count: Int?
}

struct ResponsePortalModel<M: Codable>: Codable {
    var message: String?
    var result: M?
    var errorMessage: String? {
        return message
    }
    
    private enum CodingKeys: String, CodingKey {
        case message
        case result
    }
}

struct BaseResponse: Codable {
    var message: String?
}

struct ResponseError {
    
    var status: ResultCode
    var message: String?
}

struct ImageResponse: Codable {
    var cdn_image: String?
}

struct EmptyModel: Codable {}

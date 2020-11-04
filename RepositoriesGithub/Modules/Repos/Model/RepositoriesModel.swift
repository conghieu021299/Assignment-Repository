//
//  RepositoriesModel.swift
//  RepositoriesGithub
//
//  Created by Hieu on 11/4/20.
//  Copyright © 2020 Hieunc. All rights reserved.
//

import UIKit

struct RepositoriesModel: Codable {
    var name: String?
    var owner: OwnerModel?
    var branchesUrl: String?
    
    enum CodingKeys: String, CodingKey {
        case name
        case owner
        case branchesUrl = "branches_url"
    }
    
    var author: String? {
        get {
            return owner?.login
        }
    }
}

struct OwnerModel: Codable {
    var login: String?
}

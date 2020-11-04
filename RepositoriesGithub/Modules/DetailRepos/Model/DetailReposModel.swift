//
//  DetailReposModel.swift
//  RepositoriesGithub
//
//  Created by Hieu on 11/4/20.
//  Copyright © 2020 Hieunc. All rights reserved.
//

import UIKit

struct DetailReposModel: Decodable {
    var protected: Bool?
    var name: String?
    var isType: String? {
        get {
            if protected! {
                return "Protected"
            }
            return "Unprotected"
        }
    }
}

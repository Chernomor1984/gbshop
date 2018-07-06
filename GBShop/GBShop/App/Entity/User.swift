//
//  User.swift
//  GBShop
//
//  Created by Eugene Khizhnyak on 06.07.2018.
//  Copyright © 2018 Chernomor. All rights reserved.
//

import Foundation

struct User: Codable {
    let id: Int
    let login: String
    let name: String
    let lastName: String
    
    enum CodingKeys: String, CodingKey {
        case id = "id_user"
        case login = "user_login"
        case name = "user_name"
        case lastName = "user_lastname"
    }
}

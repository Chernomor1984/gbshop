//
//  LoginResult.swift
//  GBShop
//
//  Created by Eugene Khizhnyak on 06.07.2018.
//  Copyright © 2018 Chernomor. All rights reserved.
//

import Foundation

struct LoginResult: Codable {
    let result: Int
    let user: User
}

//
//  UserBasketResult.swift
//  GBShop
//
//  Created by Eugene Khizhnyak on 20.07.2018.
//  Copyright © 2018 Chernomor. All rights reserved.
//

import Foundation

struct UserBasketResult: Codable {
    let amount: Int
    let countGoods: Int
    let contents: [UserBasketContent]
}

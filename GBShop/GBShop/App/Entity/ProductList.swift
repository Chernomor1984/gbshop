//
//  Product.swift
//  GBShop
//
//  Created by Eugene Khizhnyak on 10.07.2018.
//  Copyright © 2018 Chernomor. All rights reserved.
//

import Foundation

struct ProductList: Codable {
    let id: Int
    let name: String
    let price: Decimal
    
    enum CodingKeys: String, CodingKey {
        case id = "id_product"
        case name = "product_name"
        case price
    }
}

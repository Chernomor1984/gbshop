//
//  MethodNames.swift
//  GBShop
//
//  Created by Eugene Khizhnyak on 10.07.2018.
//  Copyright © 2018 Chernomor. All rights reserved.
//

import Foundation

enum MethodNames: String {
    case login = "login.json"
    case logout = "logout.json"
    case registerUser = "registerUser.json"
    case changeUserData = "changeUserData.json"
    case fetchProductsList = "catalogData.json"
    case fetchProduct = "getGoodById.json"
    case addReview = "addReview.json"
    case approveReview = "approveReview.json"
    case removeReview = "removeReview.json"
    case addToBasket = "addToBasket.json"
    case removeFromBasket = "deleteFromBasket.json"
    case fetchUserBasket = "getBasket.json"
}

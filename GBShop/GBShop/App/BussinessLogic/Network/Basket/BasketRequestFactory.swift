//
//  BasketRequestFactory.swift
//  GBShop
//
//  Created by Eugene Khizhnyak on 20.07.2018.
//  Copyright © 2018 Chernomor. All rights reserved.
//

import Alamofire

protocol BasketRequestFactory {
    func addToBasket(productID: Int, quantity: Int, completionHandler: @escaping (DataResponse<AddToBasketResult>) -> Void)
    func removeFromBasket(productID: Int, completionHandler: @escaping (DataResponse<RemoveFromBasketResult>) -> Void)
    func fetchUserBasket(userID: Int, completionHandler: @escaping (DataResponse<UserBasketResult>) -> Void)
}

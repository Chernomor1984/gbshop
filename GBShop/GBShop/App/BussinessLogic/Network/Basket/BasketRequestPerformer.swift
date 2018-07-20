//
//  BasketRequestPerformer.swift
//  GBShop
//
//  Created by Eugene Khizhnyak on 20.07.2018.
//  Copyright © 2018 Chernomor. All rights reserved.
//

import Alamofire

class BasketRequestPerformer: BaseRequestPerformer, BasketRequestFactory {
    func addToBasket(productID: Int, quantity: Int, completionHandler: @escaping (DataResponse<AddToBasketResult>) -> Void) {
        let addToBasketRequest = AddToBasketRequest(baseURL: baseURL, productID: productID, quantity: quantity)
        request(request: addToBasketRequest, completionHandler: completionHandler)
    }
    
    func removeFromBasket(productID: Int, completionHandler: @escaping (DataResponse<RemoveFromBasketResult>) -> Void) {
        let removeFromBasketRequest = RemoveFromBasketRequest(baseURL: baseURL, productID: productID)
        request(request: removeFromBasketRequest, completionHandler: completionHandler)
    }
    
    func fetchUserBasket(userID: Int, completionHandler: @escaping (DataResponse<UserBasketResult>) -> Void) {
        let fetchUserBasketRequest = FetchUserBasketRequest(baseURL: baseURL, userID: userID)
        request(request: fetchUserBasketRequest, completionHandler: completionHandler)
    }
}

extension BasketRequestPerformer {
    struct AddToBasketRequest: RequestRouter {
        let baseURL: URL
        let method: HTTPMethod = .get
        let path: String = MethodNames.addToBasket.rawValue
        let productID: Int
        let quantity: Int
        
        var parameters: Parameters? {
            return [
                "id_product": productID,
                "quantity": quantity
            ]
        }
    }
}

extension BasketRequestPerformer {
    struct RemoveFromBasketRequest: RequestRouter {
        let baseURL: URL
        let method: HTTPMethod = .get
        let path: String = MethodNames.removeFromBasket.rawValue
        let productID: Int
        
        var parameters: Parameters? {
            return [
                "id_product": productID
            ]
        }
    }
}

extension BasketRequestPerformer {
    struct FetchUserBasketRequest: RequestRouter {
        let baseURL: URL
        let method: HTTPMethod = .get
        let path: String = MethodNames.fetchUserBasket.rawValue
        let userID: Int
        
        var parameters: Parameters? {
            return [
                "id_user": userID
            ]
        }
    }
}

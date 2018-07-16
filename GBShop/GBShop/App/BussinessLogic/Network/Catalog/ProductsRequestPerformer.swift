//
//  ProductsRequestPerformer.swift
//  GBShop
//
//  Created by Eugene Khizhnyak on 10.07.2018.
//  Copyright © 2018 Chernomor. All rights reserved.
//

import Alamofire

class ProductsRequestPerformer: BaseRequestPerformer, ProductsRequestFactory {
    func fetchProductsList(pageNumber: Int, categoryID: Int, completionHandler: @escaping (DataResponse<[ProductList]>) -> Void) {
        let fetchProductsRequest = ProductsList(baseURL: baseURL, pageNumber: pageNumber, categoryID: categoryID)
        request(request: fetchProductsRequest, completionHandler: completionHandler)
    }
    
    func fetchProduct(productID: Int, completionHandler: @escaping (DataResponse<Product>) -> Void) {
        let fetchProductRequest = ProductEntity(baseURL: baseURL, productID: productID)
        request(request: fetchProductRequest, completionHandler: completionHandler)
    }
}

extension ProductsRequestPerformer {
    struct ProductEntity: RequestRouter {
        let baseURL: URL
        let method: HTTPMethod = .get
        let path: String = MethodNames.fetchProduct.rawValue
        let productID: Int
        
        var parameters: Parameters? {
            return [
                "id_product": productID
            ]
        }
    }
}

extension ProductsRequestPerformer {
    struct ProductsList: RequestRouter {
        let baseURL: URL
        let method: HTTPMethod = .get
        let path: String = MethodNames.fetchProductsList.rawValue
        let pageNumber: Int
        let categoryID: Int
        
        var parameters: Parameters? {
            return [
                "page_number": pageNumber,
                "id_category": categoryID
            ]
        }
    }
}

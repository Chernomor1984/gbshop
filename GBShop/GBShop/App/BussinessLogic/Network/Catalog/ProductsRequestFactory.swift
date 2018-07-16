//
//  CatalogRequestFactory.swift
//  GBShop
//
//  Created by Eugene Khizhnyak on 10.07.2018.
//  Copyright © 2018 Chernomor. All rights reserved.
//

import Alamofire

protocol ProductsRequestFactory {
    func fetchProductsList(pageNumber: Int, categoryID: Int, completionHandler: @escaping (DataResponse<[ProductList]>) -> Void)
    func fetchProduct(productID: Int, completionHandler: @escaping (DataResponse<Product>) -> Void)
}

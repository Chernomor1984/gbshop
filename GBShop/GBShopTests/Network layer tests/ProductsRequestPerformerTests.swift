//
//  ProductsRequestPerformerTests.swift
//  GBShopTests
//
//  Created by Eugene Khizhnyak on 11.07.2018.
//  Copyright © 2018 Chernomor. All rights reserved.
//

import XCTest
import OHHTTPStubs
@testable import GBShop

class ProductsRequestPerformerTests: XCTestCase {
    var productsRequestPerformer: ProductsRequestFactory!
    var ohhttpStubsResponse: OHHTTPStubsResponse!
    
    override func setUp() {
        super.setUp()
        
        let requestFactoryMok = RequestFactoryMok()
        ohhttpStubsResponse = OHHTTPStubsResponse()
        productsRequestPerformer = requestFactoryMok.makeProductsRequestFactory()
    }
    
    override func tearDown() {
        productsRequestPerformer = nil
        ohhttpStubsResponse = nil
        OHHTTPStubs.removeAllStubs()
        
        super.tearDown()
    }
    
    func testFetchProductsList() {
        let exp = expectation(description: "")
        ohhttpStubsResponse.configureStubResponse(path: MethodNames.fetchProductsList.rawValue)
        var result: [ProductList]?
        
        productsRequestPerformer.fetchProductsList(pageNumber: 1, categoryID: 1) { (response) in
            result = response.value
            exp.fulfill()
        }
        wait(for: [exp], timeout: 1)
        XCTAssertNotNil(result)
    }
    
    func testFetchProduct() {
        let exp = expectation(description: "")
        ohhttpStubsResponse.configureStubResponse(path: MethodNames.fetchProduct.rawValue)
        var result: Product?
        
        productsRequestPerformer.fetchProduct(productID: 1) { (response) in
            result = response.value
            exp.fulfill()
        }
        wait(for: [exp], timeout: 1)
        XCTAssertNotNil(result)
    }
}

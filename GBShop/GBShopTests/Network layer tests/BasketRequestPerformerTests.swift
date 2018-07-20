//
//  BasketRequestPerformerTests.swift
//  GBShopTests
//
//  Created by Eugene Khizhnyak on 20.07.2018.
//  Copyright © 2018 Chernomor. All rights reserved.
//

import XCTest
import OHHTTPStubs
@testable import GBShop

class BasketRequestPerformerTests: XCTestCase {
    var basketRequestPerformer: BasketRequestFactory!
    var ohhttpStubsResponse: OHHTTPStubsResponse!
    
    // MARK: - Test life cycle
    
    override func setUp() {
        super.setUp()
        
        let requestFactoryMok = RequestFactoryMok()
        ohhttpStubsResponse = OHHTTPStubsResponse()
        basketRequestPerformer = requestFactoryMok.makeBasketRequestFactory()
    }
    
    override func tearDown() {
        basketRequestPerformer = nil
        ohhttpStubsResponse = nil
        OHHTTPStubs.removeAllStubs()
        
        super.tearDown()
    }
    
    // MARK: - Tests
    
    func testAddToBasket() {
        let exp = expectation(description: "")
        ohhttpStubsResponse.configureStubResponse(path: MethodNames.addToBasket.rawValue)
        var result: AddToBasketResult?
        
        basketRequestPerformer.addToBasket(productID: 123, quantity: 10) { (response) in
            result = response.value
            exp.fulfill()
        }
        
        wait(for: [exp], timeout: 1)
        XCTAssertNotNil(result)
    }
    
    func testRemoveFromBasket() {
        let exp = expectation(description: "")
        ohhttpStubsResponse.configureStubResponse(path: MethodNames.removeFromBasket.rawValue)
        var result: RemoveFromBasketResult?
        
        basketRequestPerformer.removeFromBasket(productID: 123) { (response) in
            result = response.value
            exp.fulfill()
        }
        
        wait(for: [exp], timeout: 1)
        XCTAssertNotNil(result)
    }
    
    func testFetchUserBasket() {
        let exp = expectation(description: "")
        ohhttpStubsResponse.configureStubResponse(path: MethodNames.fetchUserBasket.rawValue)
        var result: UserBasketResult?
        
        basketRequestPerformer.fetchUserBasket(userID: 123) { (response) in
            result = response.value
            exp.fulfill()
        }
        
        wait(for: [exp], timeout: 1)
        XCTAssertNotNil(result)
    }
}

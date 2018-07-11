//
//  ChangeUserDataRequestPerformerTests.swift
//  GBShopTests
//
//  Created by Eugene Khizhnyak on 11.07.2018.
//  Copyright © 2018 Chernomor. All rights reserved.
//

import XCTest
import OHHTTPStubs
@testable import GBShop

class ChangeUserDataRequestPerformerTests: XCTestCase {
    var changeUserPerformer: ChangeUserDataRequestFactory!
    var ohhttpStubsResponse: OHHTTPStubsResponse!
    
    override func setUp() {
        super.setUp()
        
        let requestFactoryMok = RequestFactoryMok()
        ohhttpStubsResponse = OHHTTPStubsResponse()
        changeUserPerformer = requestFactoryMok.makeChangeUserDataRequestFactory()
    }
    
    override func tearDown() {
        changeUserPerformer = nil
        ohhttpStubsResponse = nil
        OHHTTPStubs.removeAllStubs()
        
        super.tearDown()
    }
    
    func testChangeUserData() {
        let exp = expectation(description: "")
        ohhttpStubsResponse.configureStubResponse(path: MethodNames.changeUserData.rawValue)
        var result: ChangeUserDataResult?
        let params = RegistrationParams(userID: 123,
                                                    username: "Somebody",
                                                    password: "mypassword",
                                                    email: "some@some.ru",
                                                    gender: "m",
                                                    creditCardNumber: "9872389-2424-234224-234",
                                                    bio: "This is good! I think I will switch to another language")
        changeUserPerformer.changeUserData(params: params) { (response) in
            result = response.value
            exp.fulfill()
        }
        wait(for: [exp], timeout: 1)
        XCTAssertNotNil(result)
    }
}

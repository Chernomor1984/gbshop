//
//  AuthRequestPerformerTests.swift
//  GBShopTests
//
//  Created by Eugene Khizhnyak on 11.07.2018.
//  Copyright © 2018 Chernomor. All rights reserved.
//

import XCTest
import OHHTTPStubs
@testable import GBShop

class AuthRequestPerformerTests: XCTestCase {
    var authRequestPerformer: AuthRequestFactory!
    var ohhttpStubsResponse: OHHTTPStubsResponse!
    
    override func setUp() {
        super.setUp()
        
        let requestFactoryMok = RequestFactoryMok()
        ohhttpStubsResponse = OHHTTPStubsResponse()
        authRequestPerformer = requestFactoryMok.makeAuthRequestFactory()
    }
    
    override func tearDown() {
        authRequestPerformer = nil
        ohhttpStubsResponse = nil
        OHHTTPStubs.removeAllStubs()
        
        super.tearDown()
    }
    
    func testLogin() {
        let exp = expectation(description: "")
        ohhttpStubsResponse.configureStubResponse(path: MethodNames.login.rawValue)
        var result: LoginResult?
        
        authRequestPerformer.login(userName: "admin", password: "admin") { (response) in
            result = response.value
            exp.fulfill()
        }
        wait(for: [exp], timeout: 1)
        XCTAssertNotNil(result)
    }
    
    func testLogout() {
        let exp = expectation(description: "")
        ohhttpStubsResponse.configureStubResponse(path: MethodNames.logout.rawValue)
        var result: LogoutResult?
        
        authRequestPerformer.logout(userID: 1) { (response) in
            result = response.value
            exp.fulfill()
        }
        wait(for: [exp], timeout: 1)
        XCTAssertNotNil(result)
    }
    
    func testRegisterUser() {
        let exp = expectation(description: "")
        ohhttpStubsResponse.configureStubResponse(path: MethodNames.registerUser.rawValue)
        var result: RegistrationResult?
        let registrationParams = RegistrationParams(userID: 123,
                                                    username: "Somebody",
                                                    password: "mypassword",
                                                    email: "some@some.ru",
                                                    gender: "m",
                                                    creditCardNumber: "9872389-2424-234224-234",
                                                    bio: "This is good! I think I will switch to another language")
        
        authRequestPerformer.registerUser(params: registrationParams) { (response) in
            result = response.value
            exp.fulfill()
        }
        wait(for: [exp], timeout: 1)
        XCTAssertNotNil(result)
    }
}

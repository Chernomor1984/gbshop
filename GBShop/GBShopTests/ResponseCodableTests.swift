//
//  ResponseCodableTests.swift
//  GBShopTests
//
//  Created by Eugene Khizhnyak on 11.07.2018.
//  Copyright © 2018 Chernomor. All rights reserved.
//

import XCTest
@testable import GBShop

class ResponseCodableTests: XCTestCase {
    var errorParserStub: ErrorParserStub!
    
    override func setUp() {
        super.setUp()
        errorParserStub = ErrorParserStub()
    }
    
    override func tearDown() {
        errorParserStub = nil
        super.tearDown()
    }
    
    func testResponseCodable() {}
}

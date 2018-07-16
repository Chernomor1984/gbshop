//
//  ErrorParserStub.swift
//  GBShopTests
//
//  Created by Eugene Khizhnyak on 11.07.2018.
//  Copyright © 2018 Chernomor. All rights reserved.
//

import XCTest
@testable import GBShop

enum ErrorStub: Error {
    case fatalError
}

class ErrorParserStub: AbstractErrorParser {
    func parse(_ result: Error) -> Error {
        return ErrorStub.fatalError
    }
    
    func parse(response: HTTPURLResponse?, data: Data?, error: Error?) -> Error? {
        return error
    }
}

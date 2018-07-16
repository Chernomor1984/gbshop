//
//  OHHTTPStubsResponseExtension.swift
//  GBShopTests
//
//  Created by Eugene Khizhnyak on 11.07.2018.
//  Copyright © 2018 Chernomor. All rights reserved.
//

import Foundation
import Alamofire
import OHHTTPStubs
@testable import GBShop

extension OHHTTPStubsResponse {
    func configureStubResponse(path: String, separator: Character = ".", fileExtension: String = "json") {
        let condition = isMethodGET() && pathEndsWith(path)
        
        stub(condition: condition) { (request) -> OHHTTPStubsResponse in
            let fileURL = Bundle.main.url(forResource: path.fileName(separator: separator), withExtension: fileExtension)!
            return OHHTTPStubsResponse(fileURL: fileURL, statusCode: 200, headers: nil)
        }
    }
}

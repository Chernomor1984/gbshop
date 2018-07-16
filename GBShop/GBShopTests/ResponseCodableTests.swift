//
//  ResponseCodableTests.swift
//  GBShopTests
//
//  Created by Eugene Khizhnyak on 11.07.2018.
//  Copyright © 2018 Chernomor. All rights reserved.
//

import XCTest
import Alamofire
import OHHTTPStubs
@testable import GBShop

enum MethodNamesTests: String {
    case posts = "posts/1"
}

struct ResponseCodableTestsURLConfigurator: URLConfiguration {
    let baseURL = URL(string: "https://jsonplaceholder.typicode.com/")!
}

struct  PostStub: Codable {
    let userId: Int
    let id: Int
    let title: String
    let body: String
}

protocol PostStubRequestFactory {
    func post(completionHandler: @escaping (DataResponse<PostStub>) -> Void)
}

class PostStubRequestPerformer: BaseRequestPerformer, PostStubRequestFactory {
    func post(completionHandler: @escaping (DataResponse<PostStub>) -> Void) {
        let postStubRequest = PostStubRequest(baseURL: baseURL, parameters: nil)
        request(request: postStubRequest, completionHandler: completionHandler)
    }
}

extension PostStubRequestPerformer {
    struct PostStubRequest: RequestRouter {
        let baseURL: URL
        let method: HTTPMethod = .get
        let path: String = MethodNamesTests.posts.rawValue
        var parameters: Parameters?
    }
}

class ResponseCodableTests: XCTestCase {
    var postStubRequestPerformer: PostStubRequestFactory!
    var ohhttpStubsResponse: OHHTTPStubsResponse!
    
    override func setUp() {
        super.setUp()
        
        let requestFactoryMok = RequestFactoryMok()
        ohhttpStubsResponse = OHHTTPStubsResponse()
        postStubRequestPerformer = requestFactoryMok.makePostStubRequestFactory()
    }
    
    override func tearDown() {
        postStubRequestPerformer = nil
        ohhttpStubsResponse = nil
        OHHTTPStubs.removeAllStubs()
        
        super.tearDown()
    }
    
    func testResponseCodable() {
        let exp = expectation(description: "")
        ohhttpStubsResponse.configureStubResponse(path: MethodNamesTests.posts.rawValue, separator: "/")
        var result: PostStub?
        
        postStubRequestPerformer.post() { (response) in
            result = response.value
            exp.fulfill()
        }
        wait(for: [exp], timeout: 1)
        XCTAssertNotNil(result)
    }
}

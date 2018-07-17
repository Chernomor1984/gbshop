//
//  ReviewRequestPerformerTests.swift
//  GBShopTests
//
//  Created by Eugene Khizhnyak on 14.07.2018.
//  Copyright © 2018 Chernomor. All rights reserved.
//

import XCTest
import OHHTTPStubs
@testable import GBShop

class ReviewRequestPerformerTests: XCTestCase {
    var reviewRequestPerformer: ReviewRequestFactory!
    var ohhttpStubsResponse: OHHTTPStubsResponse!
    
    // MARK: - Test life cycle
    
    override func setUp() {
        super.setUp()
        
        let requestFactoryMok = RequestFactoryMok()
        ohhttpStubsResponse = OHHTTPStubsResponse()
        reviewRequestPerformer = requestFactoryMok.makeReviewRequestFactory()
    }
    
    override func tearDown() {
        reviewRequestPerformer = nil
        ohhttpStubsResponse = nil
        OHHTTPStubs.removeAllStubs()
        
        super.tearDown()
    }
    
    // MARK: - Tests
    
    func testAddReview() {
        let exp = expectation(description: "")
        ohhttpStubsResponse.configureStubResponse(path: MethodNames.addReview.rawValue)
        var result: AddReviewResult?
        
        reviewRequestPerformer.addReview(userID: 123, text: "Какой-то отзыв!") { (response) in
            result = response.value
            exp.fulfill()
        }
        
        wait(for: [exp], timeout: 1)
        XCTAssertNotNil(result)
    }
    
    func testApproveReview() {
        let exp = expectation(description: "")
        ohhttpStubsResponse.configureStubResponse(path: MethodNames.approveReview.rawValue)
        var result: ApproveReviewResult?
        
        reviewRequestPerformer.approveReview(commentID: 123) { (response) in
            result = response.value
            exp.fulfill()
        }
        
        wait(for: [exp], timeout: 1)
        XCTAssertNotNil(result)
    }
    
    func testRemoveReview() {
        let exp = expectation(description: "")
        ohhttpStubsResponse.configureStubResponse(path: MethodNames.removeReview.rawValue)
        var result: RemoveReviewResult?
        
        reviewRequestPerformer.removeReview(commentID: 123) { (response) in
            result = response.value
            exp.fulfill()
        }
        
        wait(for: [exp], timeout: 1)
        XCTAssertNotNil(result)
    }
}

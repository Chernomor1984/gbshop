//
//  ReviewRequestPerformer.swift
//  GBShop
//
//  Created by Eugene Khizhnyak on 14.07.2018.
//  Copyright © 2018 Chernomor. All rights reserved.
//

import Alamofire

class ReviewRequestPerformer: BaseRequestPerformer, ReviewRequestFactory {
    func addReview(userID: Int, text: String, completionHandler: @escaping (DataResponse<AddReviewResult>) -> Void) {
        let addReviewRequest = AddReviewRequest(baseURL: baseURL, userID: userID, text: text)
        request(request: addReviewRequest, completionHandler: completionHandler)
    }
    
    func approveReview(commentID: Int, completionHandler: @escaping (DataResponse<ApproveReviewResult>) -> Void) {
        let approveReviewRequest = ApproveReviewRequest(baseURL: baseURL, commentID: commentID)
        request(request: approveReviewRequest, completionHandler: completionHandler)
    }
    
    func removeReview(commentID: Int, completionHandler: @escaping (DataResponse<RemoveReviewResult>) -> Void) {
        let removeReviewRequest = RemoveReviewRequest(baseURL: baseURL, commentID: commentID)
        request(request: removeReviewRequest, completionHandler: completionHandler)
    }
}

extension ReviewRequestPerformer {
    struct AddReviewRequest: RequestRouter {
        let baseURL: URL
        let method: HTTPMethod = .get
        let path: String = MethodNames.addReview.rawValue
        let userID: Int
        let text: String
        
        var parameters: Parameters? {
            return [
                "id_user": userID,
                "text": text
            ]
        }
    }
}

extension ReviewRequestPerformer {
    struct ApproveReviewRequest: RequestRouter {
        let baseURL: URL
        let method: HTTPMethod = .get
        let path: String = MethodNames.approveReview.rawValue
        let commentID: Int
        
        var parameters: Parameters? {
            return [
                "id_comment": commentID
            ]
        }
    }
}

extension ReviewRequestPerformer {
    struct RemoveReviewRequest: RequestRouter {
        let baseURL: URL
        let method: HTTPMethod = .get
        let path: String = MethodNames.removeReview.rawValue
        let commentID: Int
        
        var parameters: Parameters? {
            return [
                "id_comment": commentID
            ]
        }
    }
}

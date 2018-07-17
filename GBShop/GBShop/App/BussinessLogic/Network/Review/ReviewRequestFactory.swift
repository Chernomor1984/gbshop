//
//  ReviewRequestFactory.swift
//  GBShop
//
//  Created by Eugene Khizhnyak on 14.07.2018.
//  Copyright © 2018 Chernomor. All rights reserved.
//

import Alamofire

protocol ReviewRequestFactory {
    func addReview(userID: Int, text: String, completionHandler: @escaping (DataResponse<AddReviewResult>) -> Void)
    func approveReview(commentID: Int, completionHandler: @escaping (DataResponse<ApproveReviewResult>) -> Void)
    func removeReview(commentID: Int, completionHandler: @escaping (DataResponse<RemoveReviewResult>) -> Void)
}

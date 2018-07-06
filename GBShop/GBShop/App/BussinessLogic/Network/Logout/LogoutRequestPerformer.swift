//
//  LogoutRequestPerformer.swift
//  GBShop
//
//  Created by Eugene Khizhnyak on 06.07.2018.
//  Copyright © 2018 Chernomor. All rights reserved.
//

import Alamofire

class LogoutRequestPerformer: BaseRequestPerformer {}

extension LogoutRequestPerformer: LogoutRequestFactory {
    func logout(userID: Int, completionHandler: @escaping (DataResponse<LogoutResult>) -> Void) {
        let logoutRequest = Logout(baseURL: baseUrl, userID: userID)
        self.request(request: logoutRequest, completionHandler: completionHandler)
    }
}

extension LogoutRequestPerformer {
    struct Logout: RequestRouter {
        let baseURL: URL
        let method: HTTPMethod = .get
        let path: String = "changeUserData.json"
        let userID: Int
        
        var parameters: Parameters? {
            return [
                "id_user" : userID
            ]
        }
    }
}

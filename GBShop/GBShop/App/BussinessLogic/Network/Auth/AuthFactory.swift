//
//  Auth.swift
//  GBShop
//
//  Created by Eugene Khizhnyak on 06.07.2018.
//  Copyright © 2018 Chernomor. All rights reserved.
//

import Alamofire

class AuthFactory: BaseRequestFactory {}

extension AuthFactory: AuthRequestFactory {
    func login(userName: String, password: String, completionHandler: @escaping (DataResponse<LoginResult>) -> Void) {
        let requestModel = Login(baseURL: baseUrl, login: userName, password: password)
        self.request(request: requestModel, completionHandler: completionHandler)
    }
}

extension AuthFactory {
    struct Login: RequestRouter {
        let baseURL: URL
        let method: HTTPMethod = .get
        let path: String = "login.json"
        let login: String
        let password: String
        
        var parameters: Parameters? {
            return [
                "username": login,
                "password": password
            ]
        }
    }
}

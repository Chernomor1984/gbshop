//
//  AuthRequestFactory.swift
//  GBShop
//
//  Created by Eugene Khizhnyak on 06.07.2018.
//  Copyright © 2018 Chernomor. All rights reserved.
//

import Alamofire

protocol AuthRequestFactory {
    func login(userName: String, password: String, completionHandler: @escaping (DataResponse<LoginResult>) -> Void)
    func registerUser(params: RegistrationParams, completionHandler: @escaping (DataResponse<RegistrationResult>) -> Void)
    func logout(userID: Int, completionHandler: @escaping (DataResponse<LogoutResult>) -> Void)
}

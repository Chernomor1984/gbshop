//
//  Auth.swift
//  GBShop
//
//  Created by Eugene Khizhnyak on 06.07.2018.
//  Copyright © 2018 Chernomor. All rights reserved.
//

import Alamofire

class AuthRequestPerformer: BaseRequestPerformer, AuthRequestFactory {
    func login(userName: String, password: String, completionHandler: @escaping (DataResponse<LoginResult>) -> Void) {
        let requestModel = Login(baseURL: baseURL, login: userName, password: password)
        self.request(request: requestModel, completionHandler: completionHandler)
    }
    
    func registerUser(params: RegistrationParams, completionHandler: @escaping (DataResponse<RegistrationResult>) -> Void) {
        let registrationRequest = Registration(baseURL: baseURL, registrationParams: params)
        self.request(request: registrationRequest, completionHandler: completionHandler)
    }
    
    func logout(userID: Int, completionHandler: @escaping (DataResponse<LogoutResult>) -> Void) {
        let logoutRequest = Logout(baseURL: baseURL, userID: userID)
        self.request(request: logoutRequest, completionHandler: completionHandler)
    }
}

extension AuthRequestPerformer {
    struct Login: RequestRouter {
        let baseURL: URL
        let method: HTTPMethod = .get
        let path: String = MethodNames.login.method
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

extension AuthRequestPerformer {
    struct Registration: RequestRouter {
        let baseURL: URL
        let method: HTTPMethod = .get
        let path: String = MethodNames.registerUser.method
        let registrationParams: RegistrationParams
        
        var parameters: Parameters? {
            return [
                "id_user" : registrationParams.userID,
                "username" : registrationParams.username,
                "password" : registrationParams.password,
                "email" : registrationParams.email,
                "gender": registrationParams.gender,
                "credit_card" : registrationParams.creditCardNumber,
                "bio" : registrationParams.bio
            ]
        }
    }
}

extension AuthRequestPerformer {
    struct Logout: RequestRouter {
        let baseURL: URL
        let method: HTTPMethod = .get
        let path: String = MethodNames.logout.method
        let userID: Int
        
        var parameters: Parameters? {
            return [
                "id_user" : userID
            ]
        }
    }
}

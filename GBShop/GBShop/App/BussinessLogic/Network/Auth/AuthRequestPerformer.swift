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
        let loginRequest = Login(baseURL: baseURL, login: userName, password: password)
        request(request: loginRequest, completionHandler: completionHandler)
    }
    
    func registerUser(params: RegistrationParams, completionHandler: @escaping (DataResponse<RegistrationResult>) -> Void) {
        let registrationRequest = Registration(baseURL: baseURL, registrationParams: params)
        request(request: registrationRequest, completionHandler: completionHandler)
    }
    
    func logout(userID: Int, completionHandler: @escaping (DataResponse<LogoutResult>) -> Void) {
        let logoutRequest = Logout(baseURL: baseURL, userID: userID)
        request(request: logoutRequest, completionHandler: completionHandler)
    }
}

extension AuthRequestPerformer {
    struct Login: RequestRouter {
        let baseURL: URL
        let method: HTTPMethod = .get
        let path: String = MethodNames.login.rawValue
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
        let path: String = MethodNames.registerUser.rawValue
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
        let path: String = MethodNames.logout.rawValue
        let userID: Int
        
        var parameters: Parameters? {
            return [
                "id_user" : userID
            ]
        }
    }
}

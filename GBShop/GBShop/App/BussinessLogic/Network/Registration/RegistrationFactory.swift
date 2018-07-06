//
//  RegistrationFactory.swift
//  GBShop
//
//  Created by Eugene Khizhnyak on 06.07.2018.
//  Copyright © 2018 Chernomor. All rights reserved.
//

import Alamofire

class RegistrationFactory: BaseRequestFactory {}

extension RegistrationFactory: RegistrationRequestFactory {
    func registerUser(params: RegistrationParams, completionHandler: @escaping (DataResponse<RegistrationResult>) -> Void) {
        let registrationRequest = Registration(baseURL: baseUrl, registrationParams: params)
        self.request(request: registrationRequest, completionHandler: completionHandler)
    }
}

extension RegistrationFactory {
    struct Registration: RequestRouter {
        let baseURL: URL
        let method: HTTPMethod = .get
        let path: String = "registerUser.json"
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

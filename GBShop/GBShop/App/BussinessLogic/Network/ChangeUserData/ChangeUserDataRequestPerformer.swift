//
//  ChangeUserDataRequestPerformer.swift
//  GBShop
//
//  Created by Eugene Khizhnyak on 06.07.2018.
//  Copyright © 2018 Chernomor. All rights reserved.
//

import Alamofire

class ChangeUserDataRequestPerformer: BaseRequestPerformer {}

extension ChangeUserDataRequestPerformer: ChangeUserDataRequestFactory {
    func changeUserData(params: RegistrationParams, completionHandler: @escaping (DataResponse<ChangeUserDataResult>) -> Void) {
        let changeUserDataRequest = ChangeUserData(baseURL: baseUrl, changeUserDataParams: params)
        self.request(request: changeUserDataRequest, completionHandler: completionHandler)
    }
}

extension ChangeUserDataRequestPerformer {
    struct ChangeUserData: RequestRouter {
        let baseURL: URL
        let method: HTTPMethod = .get
        let path: String = "changeUserData.json"
        let changeUserDataParams: RegistrationParams
        
        var parameters: Parameters? {
            return [
                "id_user" : changeUserDataParams.userID,
                "username" : changeUserDataParams.username,
                "password" : changeUserDataParams.password,
                "email" : changeUserDataParams.email,
                "gender": changeUserDataParams.gender,
                "credit_card" : changeUserDataParams.creditCardNumber,
                "bio" : changeUserDataParams.bio
            ]
        }
    }
}

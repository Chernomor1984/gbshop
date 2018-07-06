//
//  RegistrationRequestFactory.swift
//  GBShop
//
//  Created by Eugene Khizhnyak on 06.07.2018.
//  Copyright © 2018 Chernomor. All rights reserved.
//

import Alamofire

protocol RegistrationRequestFactory {
    func registerUser(params: RegistrationParams, completionHandler: @escaping (DataResponse<RegistrationResult>) -> Void)
}

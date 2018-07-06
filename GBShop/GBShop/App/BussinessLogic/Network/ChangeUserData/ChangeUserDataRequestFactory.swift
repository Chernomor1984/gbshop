//
//  ChangeUserDataRequestFactory.swift
//  GBShop
//
//  Created by Eugene Khizhnyak on 06.07.2018.
//  Copyright © 2018 Chernomor. All rights reserved.
//

import Alamofire

protocol ChangeUserDataRequestFactory {
    func changeUserData(params: RegistrationParams, completionHandler: @escaping (DataResponse<ChangeUserDataResult>) -> Void)
}

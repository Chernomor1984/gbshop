//
//  LogoutRequestFactory.swift
//  GBShop
//
//  Created by Eugene Khizhnyak on 06.07.2018.
//  Copyright © 2018 Chernomor. All rights reserved.
//

import Alamofire

protocol LogoutRequestFactory {
    func logout(userID: Int, completionHandler: @escaping (DataResponse<LogoutResult>) -> Void)
}

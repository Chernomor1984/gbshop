//
//  AuthRouter.swift
//  GBShop
//
//  Created by Eugene Khizhnyak on 27.07.2018.
//  Copyright © 2018 Chernomor. All rights reserved.
//

import UIKit

class AuthRouter: AuthRouting {
    weak var viewController: UIViewController?
    
    var loginButtonTapHandler: AuthRouting.LoginButtonTapHandlerClosure? = {
        print("show controller with list of goods")
    }
    var registerButtonTapHandler: AuthRouting.RegisterButtonTapHandlerClosure? = {
    }
}

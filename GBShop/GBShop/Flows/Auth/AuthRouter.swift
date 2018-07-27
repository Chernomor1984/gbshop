//
//  AuthRouter.swift
//  GBShop
//
//  Created by Eugene Khizhnyak on 27.07.2018.
//  Copyright © 2018 Chernomor. All rights reserved.
//

import UIKit

class AuthRouter: AuthRouting {
    var viewController: UIViewController?
    
    var loginButtonTapHandler: AuthRouting.LoginButtonTapHandlerClosure? = {
    }
    var registerButtonTapHandler: AuthRouting.RegisterButtonTapHandlerClosure? = {
    }
}

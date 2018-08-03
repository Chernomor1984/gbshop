//
//  AuthView.swift
//  GBShop
//
//  Created by Eugene Khizhnyak on 27.07.2018.
//  Copyright © 2018 Chernomor. All rights reserved.
//

import UIKit

class AuthView: UIView, AuthViewProtocol {
    var configurator: AuthViewConfiguration? {
        didSet {
            configurator?.authView = self
            configurator?.configureLoginButton()
            configurator?.configureRegistrationButton()
            configurator?.configureLoginTextField()
            configurator?.configurePasswordTextField()
        }
    }
    
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var accessoryView: UIView!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var registerButton: UIButton!
    @IBOutlet weak var loginTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
}

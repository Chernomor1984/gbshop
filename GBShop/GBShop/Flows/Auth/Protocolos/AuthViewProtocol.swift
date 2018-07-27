//
//  AuthViewProtocol.swift
//  GBShop
//
//  Created by Eugene Khizhnyak on 27.07.2018.
//  Copyright © 2018 Chernomor. All rights reserved.
//

import UIKit

protocol AuthViewProtocol: class {
    var scrollView: UIScrollView! { get }
    
    var loginTextField: UITextField! { get }
    var passwordTextField: UITextField! { get }
    
    var loginButton: UIButton! { get }
    var registerButton: UIButton! { get }
    
    var configurator: AuthViewConfiguration? { get set }
}

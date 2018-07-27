//
//  AuthViewConfiguration.swift
//  GBShop
//
//  Created by Eugene Khizhnyak on 27.07.2018.
//  Copyright © 2018 Chernomor. All rights reserved.
//

import Foundation

protocol AuthViewConfiguration: class {
    
    /**
     в реализации это свойство должно быть помечено как weak
     */
    var authView: AuthViewProtocol? { get set }
    
    func configureLoginTextField()
    func configurePasswordTextField()
    func configureLoginButton()
    func configureRegistrationButton()
}

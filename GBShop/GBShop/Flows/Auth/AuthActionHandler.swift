//
//  AuthActionHandler.swift
//  GBShop
//
//  Created by Eugene Khizhnyak on 27.07.2018.
//  Copyright © 2018 Chernomor. All rights reserved.
//

import UIKit

class AuthActionHandler: AuthActionHandling {
    weak var view: AuthViewProtocol?
    
    var loginButtonTapHandler: AuthActionHandling.LoginButtonTapHandlerClosure?
    var registerButtonTapHandler: AuthActionHandling.RegisterButtonTapHandlerClosure?
    
    // MARK: - AuthActionHandling
    
    func addActions() {
        view?.loginButton.addTarget(self, action: #selector(didTapLoginButton(sender:)), for: .touchUpInside)
        view?.registerButton.addTarget(self, action: #selector(didTapRegisterButton(sender:)), for: .touchUpInside)
    }
    
    // MARK: - Actions
    
    @objc
    private func didTapLoginButton(sender: UIButton) {
        // TODO: add textfield validation
        print("didTapLoginButton")
        loginButtonTapHandler?()
    }
    
    @objc
    private func didTapRegisterButton(sender: UIButton) {
        // TODO: add textfield validation
        print("didTapRegisterButton")
        registerButtonTapHandler?()
    }
}

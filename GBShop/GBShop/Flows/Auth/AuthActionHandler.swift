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
    var validator: TextFieldValidating? {
        didSet {
            guard let view = view else {
                return
            }
            validator?.textFieldArray?.append(view.loginTextField)
            validator?.textFieldArray?.append(view.passwordTextField)
        }
    }
    
    var loginButtonTapHandler: AuthActionHandling.LoginButtonTapHandlerClosure?
    var registerButtonTapHandler: AuthActionHandling.RegisterButtonTapHandlerClosure?
    
    var validationFailed: AuthActionHandling.ValidationFailureClosure?
    
    // MARK: - AuthActionHandling
    
    func addActions() {
        view?.loginButton.addTarget(self, action: #selector(didTapLoginButton(sender:)), for: .touchUpInside)
        view?.registerButton.addTarget(self, action: #selector(didTapRegisterButton(sender:)), for: .touchUpInside)
    }
    
    // MARK: - Actions
    
    @objc
    private func didTapLoginButton(sender: UIButton) {
        guard let result = validator?.validate() else {
            return
        }
        
        switch result {
        case .success:
            // TODO: send network request
            // TODO: Add keyboard notifications
            print("success")
        case .failure(let textField):
            validationFailed?(textField)
        }
        loginButtonTapHandler?()
    }
    
    @objc
    private func didTapRegisterButton(sender: UIButton) {
        // TODO: add textfield validation
        registerButtonTapHandler?()
    }
}

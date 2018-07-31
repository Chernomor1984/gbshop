//
//  AuthViewConfigurator.swift
//  GBShop
//
//  Created by Eugene Khizhnyak on 27.07.2018.
//  Copyright © 2018 Chernomor. All rights reserved.
//

import Foundation

class AuthViewConfigurator: AuthViewConfiguration {
    
    private struct Const {
        static let loginTextFieldPlaceholder = "Логин"
        static let passwordTextFieldPlaceholder = "Пароль"
        static let loginButtonTitle = "Войти"
        static let registrationButtonTitle = "Регистрация"
    }
    
    weak var authView: AuthViewProtocol?
    
    // MARK: - AuthViewConfiguration
    
    func configureLoginTextField() {
        authView?.loginTextField.placeholder = Const.loginTextFieldPlaceholder
        authView?.loginTextField.validateFunctions = [isLoginTextFiledValid]
    }
    
    func configurePasswordTextField() {
        authView?.passwordTextField.placeholder = Const.passwordTextFieldPlaceholder
    }
    
    func configureLoginButton() {
        authView?.loginButton.setTitle(Const.loginButtonTitle, for: .normal)
    }
    
    func configureRegistrationButton() {
        authView?.registerButton.setTitle(Const.registrationButtonTitle, for: .normal)
    }
    
    // MARK: - Private
    
    private func isLoginTextFiledValid(text: String) -> Bool {
        return false
    }
    
    private func isPasswordTextFieldValid(text: String) -> Bool {
        return false
    }
}

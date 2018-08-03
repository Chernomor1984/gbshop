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
        authView?.loginTextField.clearButtonMode = .whileEditing
        authView?.loginTextField.validateFunctions = [isLoginTextFieldValid]
    }
    
    func configurePasswordTextField() {
        authView?.passwordTextField.placeholder = Const.passwordTextFieldPlaceholder
        authView?.passwordTextField.clearButtonMode = .whileEditing
        authView?.passwordTextField.validateFunctions = [isPasswordTextFieldValid]
    }
    
    func configureLoginButton() {
        authView?.loginButton.setTitle(Const.loginButtonTitle, for: .normal)
    }
    
    func configureRegistrationButton() {
        authView?.registerButton.setTitle(Const.registrationButtonTitle, for: .normal)
    }
    
    // MARK: - Private
    
    private func isLoginTextFieldValid(text: String) -> Bool {
        return !text.trimmingCharacters(in: .whitespaces).isEmpty
    }
    
    private func isPasswordTextFieldValid(text: String) -> Bool {
        return !text.trimmingCharacters(in: .whitespaces).isEmpty
    }
}

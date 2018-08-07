//
//  AuthActionHandler.swift
//  GBShop
//
//  Created by Eugene Khizhnyak on 27.07.2018.
//  Copyright © 2018 Chernomor. All rights reserved.
//

import UIKit
import Alamofire

enum LoginResultValue: Int {
    case fail
    case success
}

class AuthActionHandler: AuthActionHandling {
    typealias LoginResponse = (DataResponse<LoginResult>) -> Void
    
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
    
    var authRequestPerformer: AuthRequestFactory?
    
    var validationFailed: AuthActionHandling.ValidationFailureClosure?
    var loginFailed: AuthActionHandling.LoginFailureClosure?
    
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
            guard let login = view?.loginTextField.text, let password = view?.passwordTextField.text else {
                fatalError("No valid login/password values")
            }
            
            let completion: LoginResponse = { [weak self] (response) in
                guard let loginResult = response.value else {
                    self?.loginFailed?()
                    return
                }
                
                if loginResult.result == LoginResultValue.fail.rawValue {
                    self?.loginFailed?()
                    return
                }
                
                try? UserDefaults.standard.save(object: loginResult.user, key: UserDefaults.Const.userKey)
                self?.loginButtonTapHandler?()
            }
            authRequestPerformer?.login(userName: login, password: password, completionHandler: completion)
        case .failure(let textField):
            validationFailed?(textField)
        }
    }
    
    @objc
    private func didTapRegisterButton(sender: UIButton) {
        registerButtonTapHandler?()
    }
}

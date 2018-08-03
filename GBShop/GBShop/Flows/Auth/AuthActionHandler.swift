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
            /*
             Поскольку мы провалидировали текстфилды на корректные значения (в нашем случае они не пустые), мы можем применить force unwrap
             **/
            let completion: LoginResponse = { [weak self] (response) in
                guard let loginResult = response.value else {
                    self?.loginFailed?()
                    return
                }
                
                if loginResult.result == LoginResultValue.fail.rawValue {
                    self?.loginFailed?()
                    return
                }
                
                // TODO: save user into user defaults
                self?.loginButtonTapHandler?()
            }
            authRequestPerformer?.login(userName: (view?.loginTextField.text)!,
                                        password: (view?.passwordTextField.text)!,
                                        completionHandler: completion)
        case .failure(let textField):
            validationFailed?(textField)
        }
    }
    
    @objc
    private func didTapRegisterButton(sender: UIButton) {
        registerButtonTapHandler?()
    }
}

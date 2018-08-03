//
//  AuthActionHandling.swift
//  GBShop
//
//  Created by Eugene Khizhnyak on 27.07.2018.
//  Copyright © 2018 Chernomor. All rights reserved.
//

import UIKit

protocol AuthActionHandling: class {
    typealias LoginButtonTapHandlerClosure = () -> Void
    typealias RegisterButtonTapHandlerClosure = () -> Void
    typealias ValidationFailureClosure = (UITextField?) -> Void
    typealias LoginFailureClosure = () -> Void
    
    /**
     в реализации это свойство должно быть помечено как weak
     */
    var view: AuthViewProtocol? { get set }
    var validator: TextFieldValidating? { get set }
    var authRequestPerformer: AuthRequestFactory? { get set }
    
    var loginButtonTapHandler: LoginButtonTapHandlerClosure? { get set }
    var registerButtonTapHandler: RegisterButtonTapHandlerClosure? { get set }
    var validationFailed: ValidationFailureClosure? { get set }
    var loginFailed: AuthActionHandling.LoginFailureClosure? { get set }
    
    func addActions()
}

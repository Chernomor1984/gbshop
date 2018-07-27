//
//  AuthRouting.swift
//  GBShop
//
//  Created by Eugene Khizhnyak on 27.07.2018.
//  Copyright © 2018 Chernomor. All rights reserved.
//

import UIKit

protocol AuthRouting: class {
    typealias LoginButtonTapHandlerClosure = () -> Void
    typealias RegisterButtonTapHandlerClosure = () -> Void
    
    /**
     в реализации это свойство должно быть помечено как weak
     */
    var viewController: UIViewController? { get set }
    
    var loginButtonTapHandler: LoginButtonTapHandlerClosure? { get set }
    var registerButtonTapHandler: RegisterButtonTapHandlerClosure? { get set }
}

//
//  UserInfoNavigationBarConfigurable.swift
//  GBShop
//
//  Created by Eugene Khizhnyak on 10.08.2018.
//  Copyright © 2018 Chernomor. All rights reserved.
//

import Foundation

protocol UserInfoNavigationBarConfigurable: NavigationBarConfigurable {
    typealias CloseButtonTapHandlerClosure = () -> Void
    
    var closeButtonTapHandler: CloseButtonTapHandlerClosure? { get set }
}

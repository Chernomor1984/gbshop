//
//  UIFactory.swift
//  GBShop
//
//  Created by Eugene Khizhnyak on 24.07.2018.
//  Copyright © 2018 Chernomor. All rights reserved.
//

import UIKit

class UIFactory {
    private let requestFactory = RequestFactory()
    
    func makeAuthViewController() -> AuthViewController {
        let authRequestFactory = requestFactory.makeAuthRequestFactory()
        return AuthViewController.createAuthViewController(authRequestFactory: authRequestFactory)
    }
}

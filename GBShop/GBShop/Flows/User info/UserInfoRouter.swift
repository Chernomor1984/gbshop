//
//  UserInfoRouter.swift
//  GBShop
//
//  Created by Eugene Khizhnyak on 10.08.2018.
//  Copyright © 2018 Chernomor. All rights reserved.
//

import UIKit

class UserInfoRouter: UserInfoRouting {
    weak var viewController: UIViewController?
    
    func close() {
        if viewController?.presentingViewController != nil {
            viewController?.dismiss(animated: true, completion: nil)
        }
    }
}

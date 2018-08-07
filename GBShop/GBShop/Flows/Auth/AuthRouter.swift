//
//  AuthRouter.swift
//  GBShop
//
//  Created by Eugene Khizhnyak on 27.07.2018.
//  Copyright © 2018 Chernomor. All rights reserved.
//

import UIKit

class AuthRouter: AuthRouting {
    weak var viewController: UIViewController?
    
    func showCatalog() {
        guard let appDelegate = UIApplication.shared.delegate, let window = appDelegate.window as? UIWindow else {
            fatalError("no appDelegate found")
        }
        
        DispatchQueue.main.async {
            window.rootViewController = UIFactory().loadCatalogController()
        }
    }
    
    func showRegistration() {
    }
}

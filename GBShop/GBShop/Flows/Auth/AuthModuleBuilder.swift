//
//  AuthModuleBuilder.swift
//  GBShop
//
//  Created by Eugene Khizhnyak on 27.07.2018.
//  Copyright © 2018 Chernomor. All rights reserved.
//

import UIKit

class AuthModuleBuilder: ModuleBuilder {
    @IBOutlet weak var authViewController: AuthViewController!
    
    override func configure() {
        authViewController.mainView.configurator = AuthViewConfigurator()
        authViewController.actionHandler = AuthActionHandler()
        authViewController.actionHandler?.validator = TextFieldValidator()
        authViewController.router = AuthRouter()
    }
}

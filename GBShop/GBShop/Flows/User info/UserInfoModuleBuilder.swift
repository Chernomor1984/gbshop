//
//  UserInfoModuleBuilder.swift
//  GBShop
//
//  Created by Eugene Khizhnyak on 10.08.2018.
//  Copyright © 2018 Chernomor. All rights reserved.
//

import UIKit

class UserInfoModuleBuilder: ModuleBuilder {
    @IBOutlet weak var userInfoController: UserInfoController!
    
    override func configure() {
        userInfoController.navigationBarConfigurator = UserInfoNavigationBarConfigurator()
        userInfoController.router = UserInfoRouter()
    }
}

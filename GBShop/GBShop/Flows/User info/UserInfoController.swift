//
//  UserInfoController.swift
//  GBShop
//
//  Created by Eugene Khizhnyak on 10.08.2018.
//  Copyright © 2018 Chernomor. All rights reserved.
//

import UIKit

class UserInfoController: UIViewController {
    var navigationBarConfigurator: UserInfoNavigationBarConfigurable? {
        didSet {
            navigationItem.title = navigationBarConfigurator?.navigationBarTitle()
        }
    }
    
    var router: UserInfoRouting? {
        didSet {
            router?.viewController = self
        }
    }
    
    private var closeButtonTapHandler: UserInfoNavigationBarConfigurable.CloseButtonTapHandlerClosure?
    
    // MARK: - Life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureNavigationBar()
    }
    
    // MARK: - Private
    
    private func configureNavigationBar() {
        closeButtonTapHandler = {
            self.router?.close()
        }
        
        navigationBarConfigurator?.closeButtonTapHandler = closeButtonTapHandler
        navigationBarConfigurator?.configureNavigationBarButtonItems(navigationItem: navigationItem)
    }
}

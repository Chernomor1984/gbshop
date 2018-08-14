//
//  UserInfoNavigationBarConfigurator.swift
//  GBShop
//
//  Created by Eugene Khizhnyak on 10.08.2018.
//  Copyright © 2018 Chernomor. All rights reserved.
//

import UIKit

class UserInfoNavigationBarConfigurator: UserInfoNavigationBarConfigurable {
    var closeButtonTapHandler: UserInfoNavigationBarConfigurable.CloseButtonTapHandlerClosure?
    
    func navigationBarTitle() -> String {
        return "Личная информация"
    }
    
    func configureNavigationBarButtonItems(navigationItem: UINavigationItem?) {
        guard let navigationItem = navigationItem else {
            fatalError("no navigationItem found")
        }
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .stop,
                                                            target: self,
                                                            action: #selector(didTapCloseButton(sender:)))
    }
    
    // MARK: - Private
    
    @objc
    private func didTapCloseButton(sender: UIBarButtonItem) {
        closeButtonTapHandler?()
    }
}

//
//  NavigationBarConfigurator.swift
//  GBShop
//
//  Created by Eugene Khizhnyak on 07.08.2018.
//  Copyright © 2018 Chernomor. All rights reserved.
//

import UIKit

class CatalogNavigationBarConfigurator: CatalogNavigationBarConfigurable {
    var userSettingsButtonTapHandler: CatalogNavigationBarConfigurable.UserSettingsButtonTapHandlerClosure?
    
    func navigationBarTitle() -> String {
        return "Список товаров"
    }
    
    func configureNavigationBarButtonItems(navigationItem: UINavigationItem?) {
        guard let navigationItem = navigationItem else {
            fatalError("no navigationItem found")
        }
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .compose,
                                                            target: self,
                                                            action: #selector(didTapUserSettingsButton(sender:)))
    }
    
    // MARK: - Private
    
    @objc
    private func didTapUserSettingsButton(sender: UIBarButtonItem) {
        userSettingsButtonTapHandler?()
    }
}

//
//  UIFactory.swift
//  GBShop
//
//  Created by Eugene Khizhnyak on 24.07.2018.
//  Copyright © 2018 Chernomor. All rights reserved.
//

import UIKit

class UIFactory {
    
    private struct Const {
        static let authStoryboardName = "Auth"
        static let catalogStoryboardName = "Catalog"
    }
    
    private let requestFactory = RequestFactory()
    
    // MARK: - Public
    
    func loadAuthViewController() -> UIViewController {
        return self.loadViewController(storyboardName: Const.authStoryboardName,
                                       identifier: String.identifier(of: AuthViewController.self))
    }
    
    func loadCatalogController() -> UIViewController {
        let controller = self.loadViewController(storyboardName: Const.catalogStoryboardName,
                                                 identifier: String.identifier(of: CatalogViewController.self))
        let navigationController = UINavigationController(rootViewController: controller)
        return navigationController
    }
    
    // MARK: - Private
    
    private func loadViewController(storyboardName: String, identifier: String, bundle: Bundle? = nil) -> UIViewController {
        let storyBoard = UIStoryboard(name: storyboardName, bundle: bundle)
        return storyBoard.instantiateViewController(withIdentifier: identifier)
    }
}

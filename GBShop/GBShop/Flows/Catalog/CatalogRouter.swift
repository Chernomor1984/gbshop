//
//  CatalogRouter.swift
//  GBShop
//
//  Created by Eugene Khizhnyak on 10.08.2018.
//  Copyright © 2018 Chernomor. All rights reserved.
//

import UIKit

class CatalogRouter: CatalogRouting {
    weak var viewController: UIViewController?
    
    func showUserInfo() {
        let controller = UIFactory().loadUserInfoController()
        controller.modalTransitionStyle = .flipHorizontal
        viewController?.present(controller, animated: true, completion: nil)
    }
}

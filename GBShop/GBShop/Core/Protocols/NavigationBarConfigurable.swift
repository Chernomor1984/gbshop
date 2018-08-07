//
//  NavigationBarConfigurable.swift
//  GBShop
//
//  Created by Eugene Khizhnyak on 07.08.2018.
//  Copyright © 2018 Chernomor. All rights reserved.
//

import UIKit

protocol NavigationBarConfigurable: class {
    func navigationBarTitle() -> String
    func configureNavigationBarButtonItems(navigationItem: UINavigationItem?)
}

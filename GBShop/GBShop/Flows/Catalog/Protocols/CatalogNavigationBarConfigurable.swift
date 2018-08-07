//
//  CatalogNavigationBarConfigurable.swift
//  GBShop
//
//  Created by Eugene Khizhnyak on 07.08.2018.
//  Copyright © 2018 Chernomor. All rights reserved.
//

import UIKit

protocol CatalogNavigationBarConfigurable: NavigationBarConfigurable {
    typealias UserSettingsButtonTapHandlerClosure = () -> Void
    
    var userSettingsButtonTapHandler: UserSettingsButtonTapHandlerClosure? { get set }
}

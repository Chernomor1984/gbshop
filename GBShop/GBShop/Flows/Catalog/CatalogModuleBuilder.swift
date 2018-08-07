//
//  CatalogModuleBuilder.swift
//  GBShop
//
//  Created by Eugene Khizhnyak on 07.08.2018.
//  Copyright © 2018 Chernomor. All rights reserved.
//

import UIKit

class CatalogModuleBuilder: ModuleBuilder {
    @IBOutlet weak var catalogViewController: CatalogViewController!
    
    override func configure() {
        catalogViewController.navigationBarConfigurator = CatalogNavigationBarConfigurator()
    }
}

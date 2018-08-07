//
//  CatalogViewController.swift
//  GBShop
//
//  Created by Eugene Khizhnyak on 07.08.2018.
//  Copyright © 2018 Chernomor. All rights reserved.
//

import UIKit

class CatalogViewController: UIViewController {
    var mainView: CatalogViewProtocol {
        return view as! CatalogViewProtocol
    }
    
    var navigationBarConfigurator: CatalogNavigationBarConfigurable? {
        didSet {
            navigationItem.title = navigationBarConfigurator?.navigationBarTitle()
        }
    }
    
    private var userSettingsButtonTapHandler: CatalogNavigationBarConfigurable.UserSettingsButtonTapHandlerClosure?
    
    // MARK: - Life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.automaticallyAdjustsScrollViewInsets = false
        configureNavigationBar()
    }
    
    // MARK: - Private
    
    private func configureNavigationBar() {
        userSettingsButtonTapHandler = {
            print("did Tap user settings button")
        }
        
        navigationBarConfigurator?.userSettingsButtonTapHandler = userSettingsButtonTapHandler
        navigationBarConfigurator?.configureNavigationBarButtonItems(navigationItem: navigationItem)
    }
}

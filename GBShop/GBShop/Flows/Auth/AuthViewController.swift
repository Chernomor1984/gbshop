//
//  StartViewController.swift
//  GBShop
//
//  Created by Eugene Khizhnyak on 24.07.2018.
//  Copyright © 2018 Chernomor. All rights reserved.
//

import UIKit

class AuthViewController: UIViewController {
    var mainView: AuthViewProtocol {
        return view as! AuthViewProtocol
    }
    
    // MARK: - Life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addEndEditingTapHandler()
    }
}

//
//  StartViewController.swift
//  GBShop
//
//  Created by Eugene Khizhnyak on 24.07.2018.
//  Copyright © 2018 Chernomor. All rights reserved.
//

import UIKit

class AuthViewController: UIViewController {
    private static let storyboardName = "Auth"
    
    @IBOutlet weak var loginTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var authButton: UIButton!
    @IBOutlet weak var registerButton: UIButton!
    
    var authRequestFactory: AuthRequestFactory!
    
    // MARK: - Init
    
    class func createAuthViewController(authRequestFactory: AuthRequestFactory) -> AuthViewController {
        let identifier = UIStoryboard.identifier(of: AuthViewController.self)
        let authController = UIStoryboard.loadController(identifier: identifier, storyboardName: storyboardName) as! AuthViewController
        authController.authRequestFactory = authRequestFactory
        
        return authController
    }
    
    // MARK: - Actions
    
    @IBAction func authButtonTapHandler(sender: UIButton) {}
    
    @IBAction func registerButtonTapHandler(sender: UIButton) {}
    
    // MARK: - Life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addEndEditingTapHandler()
    }
}

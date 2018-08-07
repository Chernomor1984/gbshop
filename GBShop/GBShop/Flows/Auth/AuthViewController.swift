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
    
    var actionHandler: AuthActionHandling? {
        didSet {
            actionHandler?.view = mainView
            actionHandler?.validationFailed = validationFailed
            actionHandler?.loginFailed = loginFailed
            actionHandler?.addActions()
        }
    }
    
    var router: AuthRouting? {
        didSet {
            router?.viewController = self
            actionHandler?.loginButtonTapHandler = router?.showCatalog
            actionHandler?.registerButtonTapHandler = router?.showRegistration
        }
    }
    
    private var validationFailed: AuthActionHandling.ValidationFailureClosure?
    private var loginFailed: AuthActionHandling.LoginFailureClosure?
    
    private var keyboardListener: KeyboardListener?
    
    // MARK: - Life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        keyboardListener = KeyboardListener(scrollView: mainView.scrollView, overlappingView: mainView.accessoryView)
        keyboardListener?.registerForKeyboardWillChangeFrameNotification()
        addEndEditingTapHandler()
        
        validationFailed = { textField in
            textField?.becomeFirstResponder()
        }
        
        loginFailed = { [weak self] in
            DispatchQueue.main.async {
                self?.view.endEditing(true)
                let action = UIAlertAction(title: "Ok", style: .cancel, handler: nil)
                self?.showErrorAlert(title: "Authorization failed", message: "Wrong login or password", actions: [action])
            }
        }
    }
}

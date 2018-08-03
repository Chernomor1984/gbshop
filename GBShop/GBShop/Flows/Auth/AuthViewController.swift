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
            actionHandler?.addActions()
        }
    }
    
    var router: AuthRouting? {
        didSet {
            router?.viewController = self
            actionHandler?.loginButtonTapHandler = router?.loginButtonTapHandler
            actionHandler?.registerButtonTapHandler = router?.registerButtonTapHandler
            actionHandler?.validationFailed = validationFailed
        }
    }
    
    private var validationFailed: AuthActionHandling.ValidationFailureClosure?
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
    }
}

//
//  ViewControllerExtension.swift
//  GBShop
//
//  Created by Eugene Khizhnyak on 24.07.2018.
//  Copyright © 2018 Chernomor. All rights reserved.
//

import UIKit

extension UIViewController {
    func addEndEditingTapHandler() {
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(tapGestureHandler(sender:)))
        self.view.addGestureRecognizer(tapGestureRecognizer)
    }
    
    @objc
    func tapGestureHandler(sender: UITapGestureRecognizer) {
        self.view.endEditing(true)
    }
}

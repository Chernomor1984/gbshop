//
//  UIViewController+Extension.swift
//  GBShop
//
//  Created by Eugene Khizhnyak on 07.08.2018.
//  Copyright © 2018 Chernomor. All rights reserved.
//

import UIKit

extension UIViewController {
    func showErrorAlert(title: String?, message: String?, actions: [UIAlertAction]?) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        actions?.forEach{ action in
            alertController.addAction(action)
        }
        self.present(alertController, animated: true, completion: nil)
    }
}

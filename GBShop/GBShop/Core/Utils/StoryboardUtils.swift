//
//  StoryboardUtils.swift
//  GBShop
//
//  Created by Eugene Khizhnyak on 24.07.2018.
//  Copyright © 2018 Chernomor. All rights reserved.
//

import UIKit

extension UIStoryboard {
    class func loadStoryboard(name: String, bundle: Bundle? = nil) -> UIStoryboard {
        return UIStoryboard(name: name, bundle: bundle)
    }
    
    func name(of type: AnyClass) -> String {
        return String(describing: type)
    }
    
    func loadController(with identifier: String) -> UIViewController {
        return self.instantiateViewController(withIdentifier: identifier)
    }
}


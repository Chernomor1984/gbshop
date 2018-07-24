//
//  StoryboardUtils.swift
//  GBShop
//
//  Created by Eugene Khizhnyak on 24.07.2018.
//  Copyright © 2018 Chernomor. All rights reserved.
//

import UIKit

extension UIStoryboard {
    class func identifier(of type: AnyClass) -> String {
        return String(describing: type)
    }
    
    class func loadController(identifier: String, storyboardName: String, bundle: Bundle? = nil) -> UIViewController {
        let storyBoard = UIStoryboard(name: storyboardName, bundle: bundle)
        return storyBoard.instantiateViewController(withIdentifier: identifier)
    }
}


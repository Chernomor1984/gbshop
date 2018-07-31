//
//  UITextField.swift
//  GBShop
//
//  Created by Eugene Khizhnyak on 31.07.2018.
//  Copyright © 2018 Chernomor. All rights reserved.
//

import UIKit

extension UITextField: Validatable {
    typealias T = (String) -> Bool
    
    private struct RuntimeStoringKeys {
        static var validateFunctionsKey = "validateFunctionsKey"
    }
    
    var validateFunctions: [T]? {
        get {
            guard let value = objc_getAssociatedObject(self, &RuntimeStoringKeys.validateFunctionsKey) as? [T] else {
                return nil
            }

            return value
        }
        set {
            objc_setAssociatedObject(self, &RuntimeStoringKeys.validateFunctionsKey, newValue, .OBJC_ASSOCIATION_COPY_NONATOMIC)
        }
    }
    
    func validate(_ functions: [T]?) -> Bool {
        guard let functions = functions else {
            return true
        }
        
        return functions
            .map { function in
                function(self.text ?? "")
            }
            .reduce(true) {
                $0 && $1
        }
    }
}

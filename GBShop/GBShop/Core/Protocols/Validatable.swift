//
//  Validatable.swift
//  GBShop
//
//  Created by Eugene Khizhnyak on 31.07.2018.
//  Copyright © 2018 Chernomor. All rights reserved.
//

import Foundation

/**
 Идея взята из
 https://www.prolificinteractive.com/2016/09/08/a-functional-approach-to-uitextfield-validation-2/
 */

protocol Validatable {
    associatedtype T
    
    var validateFunctions: [T]? { get set }
    
    func validate(_ functions: [T]?) -> Bool
}

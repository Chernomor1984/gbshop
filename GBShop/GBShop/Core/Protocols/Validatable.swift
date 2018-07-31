//
//  Validatable.swift
//  GBShop
//
//  Created by Eugene Khizhnyak on 31.07.2018.
//  Copyright © 2018 Chernomor. All rights reserved.
//

import Foundation

protocol Validatable {
    associatedtype T
    
    var validateFunctions: [T]? { get set }
    
    func validate(_ functions: [T]) -> Bool
}

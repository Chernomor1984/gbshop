//
//  Evaluatable.swift
//  GBShop
//
//  Created by Eugene Khizhnyak on 31.07.2018.
//  Copyright © 2018 Chernomor. All rights reserved.
//

import Foundation

protocol Evaluatable {
    associatedtype T
    
    func evaluate(with condition: T) -> Bool
}

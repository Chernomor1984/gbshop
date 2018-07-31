//
//  TextFieldValidating.swift
//  GBShop
//
//  Created by Eugene Khizhnyak on 31.07.2018.
//  Copyright © 2018 Chernomor. All rights reserved.
//

import UIKit

protocol TextFieldValidating {
    typealias TextFieldValidatingClosure = (Bool, UITextField?) -> Void
    
    var textFieldArray: [UITextField]? { get set }
    
    func validate() -> ValidationResult<UITextField>
}

enum ValidationResult<T> {
    case success
    case failure(T?)
}

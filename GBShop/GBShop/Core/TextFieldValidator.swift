//
//  AuthTextFieldValidator.swift
//  GBShop
//
//  Created by Eugene Khizhnyak on 31.07.2018.
//  Copyright © 2018 Chernomor. All rights reserved.
//

import UIKit

class TextFieldValidator: TextFieldValidating {
    var textFieldArray: [UITextField]? = [UITextField]()
    
    func validate() -> ValidationResult<UITextField> {
        let filteredArray = textFieldArray?.filter { !$0.validate($0.validateFunctions) }
        return filteredArray?.isEmpty ?? false ? ValidationResult.success : ValidationResult.failure((filteredArray?.first))
    }
}

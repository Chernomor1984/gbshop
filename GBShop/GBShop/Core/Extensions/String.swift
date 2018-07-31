//
//  StringUtil.swift
//  GBShop
//
//  Created by Eugene Khizhnyak on 11.07.2018.
//  Copyright © 2018 Chernomor. All rights reserved.
//

import Foundation

extension String: Evaluatable {
    func fileName(separator: Character) -> String? {
        let array = self.split(separator: separator)
        
        guard let substring = array.first else {
            return nil
        }
        return String(substring)
    }
    
    func fileExtension(separator: Character) -> String? {
        let array = self.split(separator: separator)
        
        guard let substring = array.last else {
            return nil
        }
        return String(substring)
    }
    
    static func identifier(of type: AnyClass) -> String {
        return String(describing: type)
    }
    
    // MARK: - Evaluatable
    
    typealias T = String
    
    func evaluate(with condition: T) -> Bool {
        guard let range = range(of: condition, options: .regularExpression, range: nil, locale: .current) else {
            return false
        }
        
        return range.lowerBound == startIndex && range.upperBound == endIndex
    }
}

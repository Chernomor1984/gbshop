//
//  UserDefaults.swift
//  GBShop
//
//  Created by Eugene Khizhnyak on 03.08.2018.
//  Copyright © 2018 Chernomor. All rights reserved.
//

import Foundation

extension UserDefaults {
    
    public struct Const {
        static let userKey = "UserDefaultsUserKey"
    }
    
    func save<T: Codable>(object: T, key: String) throws {
        let data = try JSONEncoder().encode(object)
        set(data, forKey: key)
    }
    
    func read<T: Codable>(key: String, objectType: T.Type) throws -> T? {
        guard let data = value(forKey: key) as? Data else {
            return nil
        }
        
        return try JSONDecoder().decode(objectType, from: data)
    }
}

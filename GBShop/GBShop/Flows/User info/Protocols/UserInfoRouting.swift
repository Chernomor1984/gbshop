//
//  UserInfoRouting.swift
//  GBShop
//
//  Created by Eugene Khizhnyak on 10.08.2018.
//  Copyright © 2018 Chernomor. All rights reserved.
//

import UIKit

protocol UserInfoRouting: class {
    /**
     в реализации это свойство должно быть помечено как weak
     */
    var viewController: UIViewController? { get set }
    
    func close()
}

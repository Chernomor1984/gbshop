//
//  CatalogViewConfiguration.swift
//  GBShop
//
//  Created by Eugene Khizhnyak on 07.08.2018.
//  Copyright © 2018 Chernomor. All rights reserved.
//

import UIKit

protocol CatalogViewConfiguration {
    /**
     в реализации эти свойства должны быть помечены как weak
     */
    var catalogView: CatalogViewProtocol? { get set }
}

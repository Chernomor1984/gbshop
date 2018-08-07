//
//  CatalogViewProtocol.swift
//  GBShop
//
//  Created by Eugene Khizhnyak on 07.08.2018.
//  Copyright © 2018 Chernomor. All rights reserved.
//

import UIKit

protocol CatalogViewProtocol: class {
    var tableView: UITableView! { get }
    var configurator: CatalogViewConfiguration? { get set }
}

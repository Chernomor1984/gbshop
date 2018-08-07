//
//  CatalogView.swift
//  GBShop
//
//  Created by Eugene Khizhnyak on 07.08.2018.
//  Copyright © 2018 Chernomor. All rights reserved.
//

import UIKit

class CatalogView: UIView, CatalogViewProtocol {
    @IBOutlet weak var tableView: UITableView!
    
    var configurator: CatalogViewConfiguration? {
        didSet {
            configurator?.catalogView = self
        }
    }
}

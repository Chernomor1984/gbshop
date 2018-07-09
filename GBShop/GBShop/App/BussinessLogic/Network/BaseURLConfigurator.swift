//
//  URLConfigurator.swift
//  GBShop
//
//  Created by Eugene Khizhnyak on 09.07.2018.
//  Copyright © 2018 Chernomor. All rights reserved.
//

import Foundation

struct BaseURLConfigurator: URLConfiguration {
    let baseURL = URL(string: "https://raw.githubusercontent.com/GeekBrainsTutorial/online-store-api/master/responses/")!
}

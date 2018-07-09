//
//  BaseRequestFactory.swift
//  GBShop
//
//  Created by Eugene Khizhnyak on 06.07.2018.
//  Copyright © 2018 Chernomor. All rights reserved.
//

import Alamofire

class BaseRequestPerformer: AbstractRequestFaсtory {
    let errorParser: AbstractErrorParser
    let sessionManager: SessionManager
    let queue: DispatchQueue?
    let baseURL: URL
    
    init(errorParser: AbstractErrorParser,
         sessionManager: SessionManager,
         queue: DispatchQueue? = DispatchQueue.global(qos: .utility),
         urlConfigurator: URLConfiguration = BaseURLConfigurator()) {
        
        self.errorParser = errorParser
        self.sessionManager = sessionManager
        self.queue = queue
        self.baseURL = urlConfigurator.baseURL
    }
}

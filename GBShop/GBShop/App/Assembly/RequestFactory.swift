//
//  RequestFactory.swift
//  GBShop
//
//  Created by Eugene Khizhnyak on 06.07.2018.
//  Copyright © 2018 Chernomor. All rights reserved.
//

import Alamofire

class RequestFactory {
    
    func makeErrorParser() -> AbstractErrorParser {
        return ErrorParser()
    }
    
    lazy var sessionManager: SessionManager = {
        let configuration = URLSessionConfiguration.default
        configuration.httpShouldSetCookies = false
        configuration.httpAdditionalHeaders = SessionManager.defaultHTTPHeaders
        return SessionManager(configuration: configuration)
    }()
    
    let sessionQueue = DispatchQueue.global(qos: .utility)
    
    func makeAuthRequestFactory() -> AuthRequestFactory {
        let errorParser = makeErrorParser()
        return Auth(errorParser: errorParser, sessionManager: sessionManager, queue: sessionQueue)
    }
}

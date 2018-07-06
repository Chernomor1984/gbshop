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
        return AuthRequestPerformer(errorParser: errorParser, sessionManager: sessionManager, queue: sessionQueue)
    }
    
    func makeRegistrationRequestFactory() -> RegistrationRequestFactory {
        let errorParser = makeErrorParser()
        return RegistrationRequestPerformer(errorParser: errorParser, sessionManager: sessionManager, queue: sessionQueue)
    }
    
    func makeChangeUserDataRequestFactory() -> ChangeUserDataRequestFactory {
        let errorParser = makeErrorParser()
        return ChangeUserDataRequestPerformer(errorParser: errorParser, sessionManager: sessionManager, queue: sessionQueue)
    }
    
    func makeLogoutRequestFactory() -> LogoutRequestFactory {
        let errorParser = makeErrorParser()
        return LogoutRequestPerformer(errorParser: errorParser, sessionManager: sessionManager, queue: sessionQueue)
    }
}

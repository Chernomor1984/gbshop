//
//  RequestFactory.swift
//  GBShop
//
//  Created by Eugene Khizhnyak on 06.07.2018.
//  Copyright © 2018 Chernomor. All rights reserved.
//

import Alamofire
import OHHTTPStubs
@testable import GBShop

class RequestFactoryMok {
    
    func makeErrorParser() -> AbstractErrorParser {
        return ErrorParserStub()
    }
    
    lazy var sessionManager: SessionManager = {
        let configuration = URLSessionConfiguration.ephemeral
        OHHTTPStubs.isEnabled(for: configuration)
        return SessionManager(configuration: configuration)
    }()
    
    let sessionQueue = DispatchQueue.global(qos: .utility)
    
    func makeAuthRequestFactory() -> AuthRequestFactory {
        let errorParser = makeErrorParser()
        return AuthRequestPerformer(errorParser: errorParser, sessionManager: sessionManager, queue: sessionQueue)
    }
    
    func makeChangeUserDataRequestFactory() -> ChangeUserDataRequestFactory {
        let errorParser = makeErrorParser()
        return ChangeUserDataRequestPerformer(errorParser: errorParser, sessionManager: sessionManager, queue: sessionQueue)
    }
    
    func makeProductsRequestFactory() -> ProductsRequestFactory {
        let errorParser = makeErrorParser()
        return ProductsRequestPerformer(errorParser: errorParser, sessionManager: sessionManager, queue: sessionQueue)
    }
    
    func makePostStubRequestFactory() -> PostStubRequestFactory {
        let errorParser = makeErrorParser()
        let configurator = ResponseCodableTestsURLConfigurator()
        return PostStubRequestPerformer(errorParser: errorParser,
                                        sessionManager: sessionManager,
                                        queue: sessionQueue,
                                        urlConfigurator: configurator)
    }
    
    func makeReviewRequestFactory() -> ReviewRequestFactory {
        let errorParser = makeErrorParser()
        return ReviewRequestPerformer(errorParser: errorParser, sessionManager: sessionManager, queue: sessionQueue)
    }
}

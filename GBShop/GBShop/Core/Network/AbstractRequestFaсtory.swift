//
//  AbstractRequestFaсtory.swift
//  GBShop
//
//  Created by Eugene Khizhnyak on 06.07.2018.
//  Copyright © 2018 Chernomor. All rights reserved.
//

import Alamofire

protocol AbstractRequestFaсtory {
    var errorParser: AbstractErrorParser { get }
    var sessionManager: SessionManager { get }
    var queue: DispatchQueue? { get }
    
    @discardableResult
    func request<T: Decodable>(request: URLRequestConvertible, completionHandler: @escaping (DataResponse<T>) -> Void) -> DataRequest
}

extension AbstractRequestFaсtory {
    
    @discardableResult
    public func request<T: Decodable>(request: URLRequestConvertible, completionHandler: @escaping (DataResponse<T>) -> Void) -> DataRequest {
        return sessionManager.request(request).responseCodable(errorParser: errorParser, queue: queue, completionHandler: completionHandler)
    }
}

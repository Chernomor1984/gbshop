//
//  DataRequestExtension.swift
//  GBShop
//
//  Created by Eugene Khizhnyak on 06.07.2018.
//  Copyright © 2018 Chernomor. All rights reserved.
//

import Alamofire

extension DataRequest {
    /// Метод для парсинга JSON и преобразования его в любой Decodable класс
    @discardableResult
    func responseCodable<T: Decodable>(errorParser: AbstractErrorParser,
                                       queue: DispatchQueue? = DispatchQueue.global(qos: .utility),
                                       completionHandler: @escaping (DataResponse<T>) -> Void) -> Self {
        
        let responseSerializer = DataResponseSerializer { (request, response, data, error) -> Result<T> in
            
            if let error = errorParser.parse(response: response, data: data, error: error) {
                return .failure(error)
            }
            
            let result = Request.serializeResponseData(response: response, data: data, error: nil)
            
            switch result {
            case .success(let data):
                do {
                    let value = try JSONDecoder().decode(T.self, from: data)
                    return .success(value)
                } catch {
                    let decodeError = errorParser.parse(error)
                    return .failure(decodeError)
                }
            case .failure(let error):
                let unknownError = errorParser.parse(error)
                return .failure(unknownError)
            }
        }
        return response(queue: queue, responseSerializer: responseSerializer, completionHandler: completionHandler)
    }
}

//
//  APIService.swift
//  CNTIOSBootstrapApp
//
//  Created by Jeffrey Tabios on 3/31/22.
//

import Foundation
import Combine

protocol APIService: NetworkRouter {
    func request<T: Decodable>() -> AnyPublisher<T, Error>
}

extension APIService {
    func request<T: Decodable>() -> AnyPublisher<T, Error> {
        
        let url = URLRequestBuilderForProd()
        
        //Mock session
        let configuration = URLSessionConfiguration.default
        configuration.protocolClasses = [MockURLProtocol.self]
        let sessionManager = URLSession(configuration: configuration)
        
        //Request
        let urlRequest = try! url.asURLRequest(self)
        let cancellable = sessionManager.dataTaskPublisher(for: urlRequest)
            .tryMap { (data, response) -> Data in
                //TODO: Stuff goess here of course
                return data
            }
            .decode(type: T.self, decoder: JSONDecoder())
            .eraseToAnyPublisher()
        
        return cancellable
    }
}

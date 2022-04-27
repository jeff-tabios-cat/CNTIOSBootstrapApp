//
//  ULDefaultAPIClientProtocol.swift
//  CNTIOSBootstrapApp
//
//  Created by Mark Anthony Degamo on 4/28/22.
//

import Combine
import Foundation

/// APIClient that uses URLSession
protocol ULDefaultAPIClientProtocol: ULAPIClientProtocol {}

extension ULDefaultAPIClientProtocol {
  func request<T: Decodable>(
    url: URL,
    params: [String: Any]
  ) -> AnyPublisher<T, Error> {
    let sessionManager = URLSession(configuration: .default)
    let apiQueue = DispatchQueue(label: "API", qos: .default, attributes: .concurrent)
    let cancellable = sessionManager
      .dataTaskPublisher(for: url)
      .receive(on: apiQueue)
      .tryMap { element -> Data in
        guard let httpResponse = element.response as? HTTPURLResponse,
              httpResponse.statusCode == 200 else {
          throw URLError(.badServerResponse)
        }
        return element.data
      }
      .decode(type: T.self, decoder: JSONDecoder())
      .eraseToAnyPublisher()

    return cancellable
  }
}

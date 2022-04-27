//
//  ULAPIClientProtocol.swift
//  CNTIOSBootstrapApp
//
//  Created by Mark Anthony Degamo on 4/28/22.
//

import Combine
import Foundation

/// APIClient that doesn't care if what network lib you'll use
protocol ULAPIClientProtocol {
  var baseURL: String { get }

  func request<T: Decodable>(
    url: URL,
    params: [String: Any]
  ) -> AnyPublisher<T, Error>
}

extension ULAPIClientProtocol {
  func request<T: Decodable>(
    path: String,
    params: [String: Any]
  ) -> AnyPublisher<T, Error> {
    request(url: URL(string: "\(baseURL)\(path)")!, params: params)
  }
}

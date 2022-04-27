//
//  LoginAPIClient.swift
//  CNTIOSBootstrapApp
//
//  Created by Mark Anthony Degamo on 4/28/22.
//

import Combine
import Foundation

protocol ULLoginAPIClientProtocol: ULDefaultAPIClientProtocol {
  func login(
    username: String,
    password: String
  ) -> AnyPublisher<ULUserAPIModel, Error>
}

extension ULLoginAPIClientProtocol {
  var baseURL: String { "https://www.google.com/client/v1/rest" }
}

// MARK: - Concrete Type

final class ULLoginAPIClient: ULLoginAPIClientProtocol {
  func login(
    username: String,
    password: String
  ) -> AnyPublisher<ULUserAPIModel, Error> {
    // request(path: "/login", params: [username: username, password: password])

    // Mock for now because network request doesn't work

    let dummyUser = ULUserAPIModel(
      email: "anthony@example.com",
      firstName: "Anthony",
      lastName: "Degamo",
      createdAt: Date(),
      modifiedAt: Date(),
      accessToken: "alsfiunewkjhbasfaff782bhBDHVS",
      accessTokenExpiry: Date()
    )

    if username.lowercased() == "correct" {
      return Just(dummyUser)
        .setFailureType(to: Error.self)
        .eraseToAnyPublisher()
    } else {
      return Fail(error: NetworkError.notAuthorized)
        .eraseToAnyPublisher()
    }
  }
}

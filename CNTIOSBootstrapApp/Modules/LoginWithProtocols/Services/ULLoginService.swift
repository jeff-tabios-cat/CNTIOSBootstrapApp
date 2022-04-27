//
//  ULLoginService.swift
//  CNTIOSBootstrapApp
//
//  Created by Mark Anthony Degamo on 4/27/22.
//

import Combine

protocol ULLoginServiceProtocol {
  func login(
    username: String,
    password: String
  ) -> AnyPublisher<ULUserDTO, Error>
}

// MARK: - Concrete Type

final class ULLoginService: ULLoginServiceProtocol {
  typealias LoginResponseType = AnyPublisher<ULUserProtocol, Error>

  private let apiClient: ULLoginAPIClientProtocol

  init(apiClient: ULLoginAPIClientProtocol) {
    self.apiClient = apiClient
  }
}

// MARK: - Methods

extension ULLoginService {
  func login(
    username: String,
    password: String
  ) -> AnyPublisher<ULUserDTO, Error> {
    let cancellable: AnyPublisher<ULUserAPIModel, Error> = apiClient.login(username: username, password: password)
    return cancellable
      .map { ULUserDTO(user: $0) }
      .eraseToAnyPublisher()
  }
}

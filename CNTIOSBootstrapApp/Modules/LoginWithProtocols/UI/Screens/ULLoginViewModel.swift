//
//  ULLoginViewModel.swift
//  CNTIOSBootstrapApp
//
//  Created by Mark Anthony Degamo on 4/27/22.
//

import Combine
import Foundation

@MainActor final class ULLoginViewModel: ULLoginViewModelProtocol {
  @Published var email = ""
  @Published var password = ""
  @Published var loginResultMessage = ""

  private var cancellables: Set<AnyCancellable> = []
  private let loginService: ULLoginServiceProtocol

  init(loginService: ULLoginServiceProtocol) {
    self.loginService = loginService
  }
}

// MARK: - Methods

extension ULLoginViewModel {
  func login() {
    guard validate() else { return }

    loginService.login(username: email, password: password)
      .receive(on: DispatchQueue.main)
      .sink(
        receiveCompletion: { [weak self] completion in
          guard let self = self else { return }

          if case let .failure(error) = completion {
            self.loginResultMessage = error.localizedDescription
          }
        },
        receiveValue: { [weak self] user in
          guard let self = self else { return }
          self.loginResultMessage = "Hello there \(user.fullName)"
        }
      ).store(in: &cancellables)
  }
}

// MARK: - Helpers

private extension ULLoginViewModel {
  func validate() -> Bool {
    if email.isEmpty {
      loginResultMessage = "Email must not be empty"
      return false
    } else if password.isEmpty {
      loginResultMessage = "Password must not be empty"
      return false
    }

    return true
  }
}

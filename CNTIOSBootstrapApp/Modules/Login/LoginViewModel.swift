//
//  LoginViewModel.swift
//  CNTIOSBootstrapApp
//
//  Created by Mark Anthony Degamo on 4/22/22.
//

import Combine

final class LoginViewModel: ObservableObject {
  @Published var email = ""
  @Published var emailFieldState: CNTTextField.UIState = .active
  @Published var password = ""
  @Published var passwordFieldState: CNTTextField.UIState = .active

  @Published var isLogged: Bool = false

  private var cancellables: Set<AnyCancellable> = []
}

// MARK: - Methods

extension LoginViewModel {
  func login() {
    let sut = LoginService(username: "someUsername", password: "somePassword")

    sut.login()
      .sink(receiveCompletion: { completion in
        switch completion {
        case .finished:
          break
        case let .failure(encounteredError):
          print(encounteredError) // Do something with error
        }
      }, receiveValue: { [weak self] _ in
        guard let self = self else { return }
        // do something with response
        self.isLogged = true
      }).store(in: &cancellables)
  }
}

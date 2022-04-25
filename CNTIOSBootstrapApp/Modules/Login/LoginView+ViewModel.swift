//
//  LoginView+ViewModel.swift
//  CNTIOSBootstrapApp
//
//  Created by Mark Anthony Degamo on 4/22/22.
//

import SwiftUI
import Combine

extension LoginView {
    final class ViewModel: ObservableObject {
        @Published var email = ""
        @Published var emailFieldState: CNTTextField.UIState = .active
        @Published var password = ""
        @Published var passwordFieldState: CNTTextField.UIState = .active
        
        let isLogged = PassthroughSubject<Bool, Never>()
        
        private var cancellables: Set<AnyCancellable> = []
        
        func login() {

            let sut = LoginService(username: "someUsername", password: "somePassword")
            
            sut.login()
                .sink(receiveCompletion: { completion in
                    switch completion {
                    case .finished:
                        break
                    case .failure(let encounteredError):
                        print(encounteredError) //Do something with error
                    }
                }, receiveValue: { [weak self] response in
                    guard let self = self else { return }
                    // do something with response
                    self.isLogged.send(true)
                }).store(in: &cancellables)
        }
    }
}

//
//  LoginView+ViewModel.swift
//  CNTIOSBootstrapApp
//
//  Created by Mark Anthony Degamo on 4/22/22.
//

import SwiftUI

extension LoginView {
  final class ViewModel: ObservableObject {
    @Published var email = ""
    @Published var emailFieldState: CNTTextField.UIState = .active
    @Published var password = ""
    @Published var passwordFieldState: CNTTextField.UIState = .active
  }
}

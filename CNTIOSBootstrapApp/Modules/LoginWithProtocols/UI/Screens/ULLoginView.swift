//
//  ULLoginView.swift
//  CNTIOSBootstrapApp
//
//  Created by Mark Anthony Degamo on 4/27/22.
//

import SwiftUI

struct ULLoginView<VM>: View where VM: ULLoginViewModelProtocol {
  @StateObject var viewModel: VM
}

// MARK: - Body

extension ULLoginView {
  var body: some View {
    ScrollView {
      VStack(spacing: 16) {
        TextField("Email", text: $viewModel.email)
          .padding(8)
          .frame(height: 50)
          .border(Color.gray)

        SecureField("Password", text: $viewModel.password)
          .padding(8)
          .frame(height: 50)
          .border(Color.gray)

        if !viewModel.loginResultMessage.isEmpty {
          Text(viewModel.loginResultMessage)
        }

        Button("Login") { viewModel.login() }
          .frame(maxWidth: .infinity, minHeight: 50)
          .foregroundColor(.white)
          .background(Color.blue)
      }.padding(16)
    }
  }
}

// MARK: - Preview

struct ULLoginView_Previews: PreviewProvider {
  static var previews: some View {
    let service = ULLoginService(apiClient: ULLoginAPIClient())
    let vm = ULLoginViewModel(loginService: service)
    ULLoginView(viewModel: vm)
  }
}

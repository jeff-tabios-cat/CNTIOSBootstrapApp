//
//  LoginView.swift
//  CNTIOSBootstrapApp
//
//  Created by Mark Anthony Degamo on 4/21/22.
//

import SwiftUI

struct LoginView: View {
  @StateObject private var viewModel = ViewModel()

  var body: some View {
    ScrollView {
      ZStack {
        CircleBackgroundView()
        VStack(alignment: .center, spacing: 0) {
          Image(systemName: "heart.fill")
            .resizable()
            .frame(width: 163, height: 12)
            .padding(.top, 30)
            .padding(.bottom, 30)

          Image(systemName: "heart.fill")
            .resizable()
            .padding(.bottom, 30)
            .frame(width: 163, height: 175)

          Text("Welcome to Urban Legend!")
            .padding(.bottom, 15)
            .frame(maxWidth: .infinity, alignment: .leading)
            .appTypographyStyle(.largeTitle)

          Text("Lorem ipsum dolor")
            .padding(.bottom, 40)
            .frame(maxWidth: .infinity, alignment: .leading)
            .appTypographyStyle(.header2)

          CNTTextField(
            placeholder: "Email",
            value: $viewModel.email,
            uiState: $viewModel.emailFieldState
          )
          .padding(.bottom, 10)

          CNTTextField(
            placeholder: "Password",
            value: $viewModel.password,
            uiState: $viewModel.passwordFieldState
          )
          .padding(.bottom, 20)

          UnderlinedButton("Forgot password?") {
            print("Forgot password tapped")
          }

          CNTButton("Sign In", theme: .primary) {
            print("Sign In tapped")
          }
          .frame(height: 50)
          .padding(.bottom, 15)

          CNTButton("Sign In with Apple", theme: .outline) {
            print("Sign In tapped")
          }
          .frame(height: 50)
          .padding(.bottom, 20)

          HStack {
            UnderlinedButton("Contact Us") {
              print("Contact Us tapped")
            }

            Rectangle()
              .foregroundColor(.gray)
              .frame(width: 1, height: 30)

            UnderlinedButton("About Us") {
              print("About Us tapped")
            }
          }
        }
        .padding(16)
        
          //TODO: Link to main page
//          NavigationLink(destination: MAINPAGE(), isActive: $viewModel.isFTUEViewActive){}
      }
    }
  }
}

// MARK: - Private inner views

private extension LoginView {
  struct CircleBackgroundView: View {
    var body: some View {
      GeometryReader { geometry in
        let width = geometry.size.width * 1.5
        let height = geometry.size.height * 1.5

        Circle()
          .foregroundColor(.gray)
          .frame(
            width: width,
            height: height
          )
          .offset(x: -(width / 6), y: -(height / 1.7))
      }
      .ignoresSafeArea()
    }
  }

  struct UnderlinedButton: View {
    private var title: String!
    private var action: () -> Void

    init(
      _ title: String,
      action: @escaping () -> Void
    ) {
      self.title = title
      self.action = action
    }

    var body: some View {
      Button(
        action: action,
        label: {
          Text(title)
            .underline()
            .foregroundColor(.black)
        }
      )
      .padding(20)
    }
  }
}

struct LoginView_Previews: PreviewProvider {
  static var previews: some View {
    LoginView()
  }
}

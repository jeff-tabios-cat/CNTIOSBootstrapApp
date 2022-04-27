//
//  ContentView.swift
//  CNTIOSBootstrapApp
//
//  Created by Jeffrey Tabios on 4/12/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
          let service = ULLoginService(apiClient: ULLoginAPIClient())
          let vm = ULLoginViewModel(loginService: service)
          ULLoginView(viewModel: vm)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

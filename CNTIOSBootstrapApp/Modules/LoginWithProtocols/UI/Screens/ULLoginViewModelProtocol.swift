//
//  ULLoginViewModelProtocol.swift
//  CNTIOSBootstrapApp
//
//  Created by Mark Anthony Degamo on 4/27/22.
//

import Combine

@MainActor protocol ULLoginViewModelProtocol: ObservableObject {
  var email: String { get set }
  var password: String { get set }
  var loginResultMessage: String { get }

  func login()
}

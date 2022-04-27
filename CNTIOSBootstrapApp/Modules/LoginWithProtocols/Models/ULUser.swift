//
//  ULUserAPIModel.swift
//  CNTIOSBootstrapApp
//
//  Created by Mark Anthony Degamo on 4/27/22.
//

import Foundation

protocol ULUserProtocol {
  var email: String { get }
  var firstName: String { get }
  var lastName: String { get }
}

// MARK: - API

struct ULUserAPIModel: ULUserProtocol, Codable {
  let email: String
  let firstName: String
  let lastName: String
  let createdAt: Date
  let modifiedAt: Date
  let accessToken: String
  let accessTokenExpiry: Date
}

// MARK: - DTO

struct ULUserDTO: ULUserProtocol {
  let email: String
  let firstName: String
  let lastName: String

  var fullName: String { "\(firstName) \(lastName)" }
}

extension ULUserDTO {
  init(user: ULUserProtocol) {
    email = user.email
    firstName = user.firstName
    lastName = user.lastName
  }
}

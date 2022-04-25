//
//  AppSession.swift
//  CNTIOSBootstrapApp
//
//  Created by Jeffrey Tabios on 4/25/22.
//

import Foundation

protocol Session {
    func getToken() -> String?
}

final class AppSession: Session {
    static let shared = AppSession()
    func getToken() -> String? {
        return "someTokenString"
    }
}

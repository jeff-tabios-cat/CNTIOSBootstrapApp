//
//  LoginService.swift
//  CNTIOSBootstrapApp
//
//  Created by Jeffrey Tabios on 4/19/22.
//

import Foundation
import Combine

final class LoginService: APIService {
    let method: HTTPMethod = .get
    let urlString: String
    let headers: [String : String]? = nil;
    let parameters: Any?
    let authToken: AuthToken = .none
    
    init(username: String, password: String) {
        urlString = Server.baseURL + "/login"
        let parametersDictionary: [String: String] = ["username": username, "password": password]
        parameters = parametersDictionary
    }
    
    func login() -> AnyPublisher<LoginResponse, Error> {
        let cancellable: AnyPublisher<LoginResponse, Error> = request()
        return cancellable
    }
}

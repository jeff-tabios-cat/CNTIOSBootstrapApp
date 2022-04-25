//
//  NetworkRouter.swift
//  CNTIOSBootstrapApp
//
//  Created by Jeffrey Tabios on 4/19/22.
//

import Foundation

enum AuthToken {
    case shared
    case none
}

enum HTTPMethod: String {
    case get = "GET"
    case post = "POST"
    case put = "PUT"
    case delete = "DELETE"
    case patch = "PATCH"
}

protocol NetworkRouter {
    var method: HTTPMethod { get }
    var urlString: String { get }
    var headers: [String: String]? { get }
    var parameters: Any? { get }
    var authToken: AuthToken { get }
    
    var bodyData: Data? { get }
    var cachePolicy: NSURLRequest.CachePolicy? { get }
    var isJsonContentType: Bool { get }
}

extension NetworkRouter {
    
    var cachePolicy: NSURLRequest.CachePolicy? {
        return nil
    }
    
    var bodyData: Data? {
        return nil
    }
    
    var isJsonContentType: Bool {
        return true
    }
    
}

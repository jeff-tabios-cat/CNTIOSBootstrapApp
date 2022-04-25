//
//  Constants.swift
//  CNTIOSBootstrapApp
//
//  Created by Jeffrey Tabios on 4/19/22.
//

import UIKit

enum NetworkStatusCode {
    static let notAuthorized = 401
    static let notFound = 404
    static let serverNotAvailable = 503
}

enum Server {

    static var baseURL: String {
        return URL.API.dev //can have condition to swift from dev to prod
    }
    
    static var websocketURL: String {
        return URL.Websocket.dev //can have condition to swift from dev to prod
    }
    
    enum Header {
        enum Key {
            static let contentType = "Content-Type"
            static let authorization = "Authorization"
        }
        enum Value {
            static let json = "application/json"
        }
    }
    
    private enum URL {
        enum API {
            static let dev = "https://api.dev.urbanlegend.com/api"
            static let prod = "https://api.urbanlegend.com/api"
        }
        
        enum Websocket {
            static let dev = "wss://ws.dev.urbanlegend.com"
            static let prod = "wss://ws.urbanlegend.com"
        }
    }
    
}

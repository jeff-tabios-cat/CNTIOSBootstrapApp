//
//  NetworkError.swift
//  CNTIOSBootstrapApp
//
//  Created by Jeffrey Tabios on 4/19/22.
//

import Foundation

enum NetworkError: Error {
    case invalidURL
    case cannotSerializeParameters
    case noDataAvailable
    case invalidResponse
    case noInternetConnection
    case noTokenFound
    case notAuthorized
    case notFound
    case serverError
    case error(code: Int)
}

extension NetworkError: LocalizedError {
    
    var errorDescription: String? {
        switch self {
        case .invalidURL:
            return NSLocalizedString("URL you are trying to reach is invalid", comment: "")
        case .cannotSerializeParameters:
            return NSLocalizedString("Request parameters are invalid", comment: "")
        case .noDataAvailable:
            return NSLocalizedString("No data available for your request", comment: "")
        case .invalidResponse:
            return NSLocalizedString("Server response is invalid. Please try again later", comment: "")
        case .noInternetConnection:
            return NSLocalizedString("Please check your internet connection", comment: "")
        case .noTokenFound:
            return NSLocalizedString("There is no user token", comment: "")
        case .notAuthorized:
            return NSLocalizedString("User is not authorized", comment: "")
        case .notFound:
            return NSLocalizedString("Not found", comment: "")
        case .serverError:
            return NSLocalizedString("Servers down", comment: "")
        case .error(let code):
            return NSLocalizedString("Network error \(code)", comment: "")
        }
    }
}

// MARK: CustomNSError
extension NetworkError: CustomNSError {
    var errorCode: Int {
        switch self {
        case .notAuthorized:
            return NetworkStatusCode.notAuthorized
        case .notFound:
            return NetworkStatusCode.notFound
        case .serverError:
            return NetworkStatusCode.serverNotAvailable
        case .error(let code):
            return code
        default:
            return 0
        }
    }
}

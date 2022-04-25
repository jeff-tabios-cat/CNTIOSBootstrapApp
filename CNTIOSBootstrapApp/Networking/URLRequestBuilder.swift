//
//  URLRequestBuilder.swift
//  CNTIOSBootstrapApp
//
//  Created by Jeffrey Tabios on 4/19/22.
//

import Foundation

protocol URLRequestBuilder {
    func asURLRequest(_ router: NetworkRouter) throws -> URLRequest
}

struct URLRequestBuilderForProd: URLRequestBuilder {
    
    private func getSharedToken() -> String? {
        return AppSession.shared.getToken()
    }
    
    func asURLRequest(_ router: NetworkRouter) throws -> URLRequest {
        let urlString = router.urlString
        guard var urlComponents = URLComponents(string: urlString) else {
            throw NetworkError.invalidURL
        }
        
        if let parameters = router.parameters {
            switch router.method {
            case .get, .delete:
                guard let parametersDictionary = parameters as? [String: Any] else { break }
                let queryItems: [URLQueryItem] = parametersDictionary.compactMap({
                    guard let value = $0.value as? String else { return nil }
                    return URLQueryItem(name: $0.key, value: value)
                })
                urlComponents.queryItems = queryItems
                
            case .post, .put, .patch:
                break
            }
        }
        
        guard let url = urlComponents.url else {
            throw NetworkError.invalidURL
        }
        var request = URLRequest(url: url)
        request.httpMethod = router.method.rawValue
        
        if let bodyData = router.bodyData {
            request.httpBody = bodyData
        } else if let parameters = router.parameters {
            switch router.method {
            case .post, .put, .patch:
                do {
                    request.httpBody = try JSONSerialization.data(withJSONObject: parameters, options: .fragmentsAllowed)
                } catch {
                    throw NetworkError.cannotSerializeParameters
                }
            case .get, .delete:
                break
            }
        }
        
        if let headers = router.headers {
            headers.forEach { (headerTitle, headerValue) in
                request.addValue(headerValue, forHTTPHeaderField: headerTitle)
            }
        }
        
        if router.isJsonContentType {
            request.addValue(Server.Header.Value.json, forHTTPHeaderField: Server.Header.Key.contentType)
        }
        
        switch router.authToken {
        case .none:
            break
        case .shared:
            if let accessToken = getSharedToken() {
                request.addValue("Bearer \(accessToken)", forHTTPHeaderField: Server.Header.Key.authorization)
            } else {
                throw NetworkError.noTokenFound
            }
        }
        
        if let cachePolicy = router.cachePolicy {
            request.cachePolicy = cachePolicy
        }
        return request
    }
    
}

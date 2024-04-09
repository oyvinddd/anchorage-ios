//
//  URLRequestBuilder.swift
//  Anchorage
//
//  Created by Øyvind Hauge on 09/04/2024.
//

import Foundation

final class URLRequestBuilder {
    
    let method: HTTPMethod
    let url: URL
    var headers: [String: String] = [:]
    var body: Data?
    
    init(url: String, method: HTTPMethod, useDefaultHeaders: Bool = true) {
        self.method = method
        self.url = URL(string: url)!
        if useDefaultHeaders {
            headers = defaultHeaders()
        }
    }
    
    @discardableResult
    func set(value: String, for header: String) -> Self {
        headers[header] = value
        return self
    }
    
    @discardableResult
    func set(body: Encodable) -> Self {
        self.body = try? JSONEncoder().encode(body)
        return self
    }
    
    func build() -> URLRequest {
        var request = URLRequest(url: url)
        request.httpMethod = method.rawValue
        
        // add http headers to the request
        for (key, value) in headers {
            request.addValue(value, forHTTPHeaderField: key)
        }
            
        // add our data to http body of the request
        request.httpBody = body
        
        return request
    }
    
    private func defaultHeaders() -> [String: String] {
        return ["Content-Type": "application/json"]
    }
}
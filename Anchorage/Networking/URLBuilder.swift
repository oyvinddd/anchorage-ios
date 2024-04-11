//
//  URLBuilder.swift
//  Anchorage
//
//  Created by Øyvind Hauge on 10/04/2024.
//

import Foundation

final class URLBuilder {
    
    private static var baseUrl: String?
    
    var path: String
    
    class func initialize(apiBaseUrl: String) {
        self.baseUrl = apiBaseUrl
    }
    
    init(_ path: String, addApiAndVersionPath: Bool = true) {
        self.path = addApiAndVersionPath ? "/api/v1/" : "/"
        self.path += path
    }
    
    @discardableResult
    func append(path: String) -> Self {
        self.path += ("/" + path)
        return self
    }
    
    func build() throws -> URL {
        guard let baseUrl = URLBuilder.baseUrl else {
            throw NetworkError.badApiUrl
        }
        
        guard let finalUrl = URL(string: "\(baseUrl)\(path)") else {
            throw NetworkError.missingBaseUrl
        }
        
        return finalUrl
    }
}

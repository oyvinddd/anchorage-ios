//
//  NetworkError.swift
//  Anchorage
//
//  Created by Øyvind Hauge on 10/04/2024.
//

import Foundation

enum NetworkError: Error, LocalizedError {
    
    case missingBaseUrl
    
    case badApiUrl
}

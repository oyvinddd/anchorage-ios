//
//  TokenContainer.swift
//  Anchorage
//
//  Created by Øyvind Hauge on 19/04/2024.
//

import Foundation

struct TokenContainer: Codable {
    
    var accessToken: String?
    
    var refreshToken: String?
    
    init(_ accessToken: String?, _ refreshToken: String?) {
        self.accessToken = accessToken
        self.refreshToken = refreshToken
    }
}

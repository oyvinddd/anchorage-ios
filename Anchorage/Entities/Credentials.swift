//
//  Credentials.swift
//  Anchorage
//
//  Created by Øyvind Hauge on 09/04/2024.
//

import Foundation

struct Credentials: Codable {
    
    var id: UUID
    
    var email: String
    
    var accessToken: String?
    
    var refreshToken: String?
}

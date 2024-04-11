//
//  Credentials.swift
//  Anchorage
//
//  Created by Øyvind Hauge on 09/04/2024.
//

import Foundation

protocol CredentialsInjectable {
    
    var credentials: Credentials? { get }
}

extension CredentialsInjectable {
    
    var credentials: Credentials? { return Credentials.current }
}

struct Credentials: Codable {
    
    static var current: Credentials? = try? KeychainWrapper.load(key: "credentials")
    
    var id: UUID
    
    var email: String
    
    var accessToken: String?
    
    var refreshToken: String?
}

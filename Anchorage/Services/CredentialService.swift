//
//  CredentialService.swift
//  Anchorage
//
//  Created by Øyvind Hauge on 11/04/2024.
//

import Foundation

protocol CredentialServiceInjectable {
    
    var credentialService: CredentialService? { get }
}

extension CredentialServiceInjectable {
    
    var credentialService: CredentialService? { return ServiceFactory.instance.credentialService }
}

protocol CredentialService {
    
    var credentials: Credentials? { get }
    
    var accessToken: String? { get }
    
    var authenticated: Bool { get }
}

final class LiveCredentialService: CredentialService {
    
    static let shared = LiveCredentialService()

    var credentials: Credentials? = try? KeychainWrapper.load(key: "credentials")
    
    var accessToken: String? { credentials?.accessToken }
    
    var authenticated: Bool { credentials?.accessToken != nil }
}

final class MockedCredentialService: CredentialService {
    
    static let shared = LiveCredentialService()
    
    var credentials: Credentials? = try? KeychainWrapper.load(key: "credentials")
    
    var accessToken: String? { credentials?.accessToken }
    
    var authenticated: Bool { credentials?.accessToken != nil }
}

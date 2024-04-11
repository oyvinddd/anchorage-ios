//
//  AuthenticationService.swift
//  Anchorage
//
//  Created by Øyvind Hauge on 11/04/2024.
//

import Foundation

protocol AuthenticationServiceInjectable {
    
    var authenticationService: AuthenticationService { get }
}

extension AuthenticationServiceInjectable {
    
}

protocol AuthenticationService {
    
}

final class LiveAuthenticationService: AuthenticationService {}

final class MockedAuthenticationService: AuthenticationService {}

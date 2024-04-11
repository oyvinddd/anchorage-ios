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
    
    var authenticationService: AuthenticationService { ServiceFactory.instance.authenticationService }
}

protocol AuthenticationService {
    
    var googleAuthUrl: URL { get }
    
    var appleAuthUrl: URL { get }
}

final class LiveAuthenticationService: AuthenticationService, RequestFactoryInjectable {
    
    var googleAuthUrl: URL { requestFactory.googleAuthUrl }
    
    var appleAuthUrl: URL { requestFactory.appleAuthUrl }
}

final class MockedAuthenticationService: AuthenticationService, RequestFactoryInjectable {
    
    var googleAuthUrl: URL { requestFactory.googleAuthUrl }
    
    var appleAuthUrl: URL { requestFactory.appleAuthUrl }
}

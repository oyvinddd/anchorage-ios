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
    
    func handleAuthenticationRedirect(url: URL) -> Bool
}

final class LiveAuthenticationService: AuthenticationService, RequestFactoryInjectable {

    var googleAuthUrl: URL { requestFactory.googleAuthUrl }
    
    var appleAuthUrl: URL { requestFactory.appleAuthUrl }
    
    func handleAuthenticationRedirect(url: URL) -> Bool {
        print("AUTH REDIRECT")
        return true
    }
}

final class MockedAuthenticationService: AuthenticationService, RequestFactoryInjectable {
    
    var googleAuthUrl: URL { requestFactory.googleAuthUrl }
    
    var appleAuthUrl: URL { requestFactory.appleAuthUrl }
    
    func handleAuthenticationRedirect(url: URL) -> Bool {
        print("AUTH REDIRECT")
        return true
    }
}

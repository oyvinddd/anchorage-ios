//
//  ServiceFactory.swift
//  Anchorage
//
//  Created by Øyvind Hauge on 09/04/2024.
//

import Foundation

protocol ServiceFactoryProtocol {
    
    var authenticationService: AuthenticationService { get }
    var accountService: AccountService { get }
    var eventService: EventService { get }
    var tokenService: TokenService { get }
}

// MARK: - Live service factory

final class ServiceFactory: ServiceFactoryProtocol {
    
    static let instance = ServiceFactory()
        
    var authenticationService: AuthenticationService { return LiveAuthenticationService() }
    var accountService: AccountService { return LiveAccountService() }
    var eventService: EventService { return LiveEventService() }
    var tokenService: TokenService { return LiveTokenService.shared }
}

// MARK: - Mocked service factory

final class MockedServiceFactory: ServiceFactoryProtocol {
    
    static let instance = ServiceFactory()
    
    var authenticationService: AuthenticationService { return MockedAuthenticationService() }
    var accountService: AccountService { return MockedAccountService() }
    var eventService: EventService { return MockedEventService() }
    var tokenService: TokenService { return MockedTokenService.shared }
}

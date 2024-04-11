//
//  ServiceFactory.swift
//  Anchorage
//
//  Created by Øyvind Hauge on 09/04/2024.
//

import Foundation

protocol ServiceFactoryProtocol {
    
    var accountService: AccountService { get }
    var eventService: EventService { get }
    var credentialService: CredentialService { get }
}

// MARK: - Live service factory

final class ServiceFactory: ServiceFactoryProtocol {
    
    static let instance = ServiceFactory()
    
    var accountService: AccountService { return LiveAccountService() }
    var eventService: EventService { return LiveEventService() }
    var credentialService: CredentialService { return LiveCredentialService.shared }
}

// MARK: - Mocked service factory

final class MockedServiceFactory: ServiceFactoryProtocol {
    
    static let instance = ServiceFactory()
    
    var accountService: AccountService { return MockedAccountService() }
    var eventService: EventService { return MockedEventService() }
    var credentialService: CredentialService { return MockedCredentialService.shared }
}

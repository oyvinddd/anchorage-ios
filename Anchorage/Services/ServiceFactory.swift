//
//  ServiceFactory.swift
//  Anchorage
//
//  Created by Øyvind Hauge on 09/04/2024.
//

import Foundation

protocol ServiceFactoryProtocol {
    
    var eventService: EventService { get }
}

// MARK: - Live service factory

final class ServiceFactory: ServiceFactoryProtocol {
    
    static let instance = ServiceFactory()
    
    var eventService: EventService { return AnchorageEventService() }
}

// MARK: - Mocked service factory

final class MockedServiceFactory: ServiceFactoryProtocol {
    
    static let instance = ServiceFactory()
    
    var eventService: EventService { return MockedEventService() }
}

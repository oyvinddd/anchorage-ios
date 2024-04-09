//
//  EventService.swift
//  Anchorage
//
//  Created by Øyvind Hauge on 09/04/2024.
//

import Foundation

protocol EventServiceInjectable {
    
    var eventService: EventService { get }
}

extension EventServiceInjectable {

    var eventService: EventService { return ServiceFactory.instance.eventService }
}

protocol EventService {
    
    func createEvent(_ event: Event) async throws -> Event
    
    func listEvents() async throws -> [Event]
    
    func deleteEvent(_ event: Event) async throws
}

// MARK: - Live event service

final class AnchorageEventService: EventService, NetworkManagerInjectable {
    
    func createEvent(_ event: Event) async throws -> Event {
        fatalError()
    }
    
    func listEvents() async throws -> [Event] {
        fatalError()
    }
    
    func deleteEvent(_ event: Event) async throws {
        fatalError()
    }
}

// MARK: - Mocked event service

final class MockedEventService: EventService {
    
    func createEvent(_ event: Event) async throws -> Event {
        fatalError()
    }
    
    func listEvents() async throws -> [Event] {
        fatalError()
    }
    
    func deleteEvent(_ event: Event) async throws {
        fatalError()
    }
}

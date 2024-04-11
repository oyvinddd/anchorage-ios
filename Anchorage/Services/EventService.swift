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
    
    func deleteEvent(_ eventId: UUID) async throws
}

// MARK: - Live event service

final class LiveEventService: EventService, RequestFactoryInjectable, NetworkManagerInjectable {
    
    func createEvent(_ event: Event) async throws -> Event {
        let request = requestFactory.createEventRequest(event: event)
        return try await networkManager.execute(request: request)
    }
    
    func listEvents() async throws -> [Event] {
        let request = requestFactory.listEventsRequest()
        return try await networkManager.execute(request: request)
    }
    
    func deleteEvent(_ eventId: UUID) async throws {
        let request = requestFactory.deleteEventRequest(eventId: eventId)
        try await networkManager.execute(request: request)
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
    
    func deleteEvent(_ eventId: UUID) async throws {
        fatalError()
    }
}

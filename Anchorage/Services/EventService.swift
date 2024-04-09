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

final class LiveEventService: EventService, AccountServiceInjectable, NetworkManagerInjectable {
    
    func createEvent(_ event: Event) async throws -> Event {
        
        let request = URLRequestBuilder("http:localhost:8888/api/v1/events")
            .set(method: .post)
            .set(body: event)
            .build()
        
        return try await networkManager.execute(request: request)
    }
    
    func listEvents() async throws -> [Event] {
        let request = URLRequestBuilder("http://localhost:8888/api/v1/events").build()
        return try await networkManager.execute(request: request)
    }
    
    func deleteEvent(_ eventId: UUID) async throws {
        let request = URLRequestBuilder("http://localhost:8888/api/v1/events/\(eventId)")
            .set(method: .delete)
            .build()
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

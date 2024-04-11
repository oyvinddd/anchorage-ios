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
        let url = try URLBuilder("events").build()
        let req = URLRequestBuilder(.post, url: url).set(body: event).build()
        return try await networkManager.execute(request: req)
    }
    
    func listEvents() async throws -> [Event] {
        let url = try URLBuilder("events").build()
        let req = URLRequestBuilder(.get, url: url).build()
        return try await networkManager.execute(request: req)
    }
    
    func deleteEvent(_ eventId: UUID) async throws {
        let url = try URLBuilder("events").append(path: eventId.uuidString).build()
        let req = URLRequestBuilder(.delete, url: url).build()
        try await networkManager.execute(request: req)
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

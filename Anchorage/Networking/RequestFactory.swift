//
//  RequestFactory.swift
//  Anchorage
//
//  Created by Øyvind Hauge on 10/04/2024.
//

import Foundation

protocol RequestFactoryInjectable {
    
    var requestFactory: RequestFactory { get }
}

extension RequestFactoryInjectable {
    
    var requestFactory: RequestFactory { RequestFactory(apiBaseUrl: AppSettings.apiBaseUrl) }
}

final class RequestFactory: CredentialServiceInjectable {
    
    var apiBaseUrl: URL!
    
    var eventsUrl: URL { apiBaseUrl.appendingPathComponent("events") }
    
    var accountUrl: URL { apiBaseUrl.appendingPathComponent("account") }
    
    var googleAuthUrl: URL { apiBaseUrl.appendingPathComponent("auth").appendingPathComponent("google") }
    
    var appleAuthUrl: URL { apiBaseUrl.appendingPathComponent("auth").appendingPathComponent("apple") }
    
    init(apiBaseUrl: String, addApiAndVersionPath: Bool = true) {
        self.apiBaseUrl = URL(string: apiBaseUrl + (addApiAndVersionPath ? "/api/v1" : ""))!
    }
    
    // MARK: - Account requests
    
    func deleteAccountRequest() -> URLRequest {
        return RequestBuilder(.delete, url: accountUrl)
            .set(bearerToken: credentialService?.accessToken)
            .build()
    }
    
    // MARK: - Event requests
    
    func createEventRequest(event: Event) -> URLRequest {
        return RequestBuilder(.post, url: eventsUrl)
            .set(value: "Content-Type", for: "application/json")
            .set(bearerToken: credentialService?.accessToken)
            .set(body: event)
            .build()
    }
    
    func listEventsRequest() -> URLRequest {
        return RequestBuilder(.get, url: eventsUrl)
            .set(bearerToken: credentialService?.accessToken)
            .build()
    }
    
    func deleteEventRequest(eventId: UUID) -> URLRequest {
        let eventUrl = eventsUrl.appendingPathComponent(eventId.uuidString)
        return RequestBuilder(.delete, url: eventUrl)
            .set(bearerToken: credentialService?.accessToken)
            .build()
    }
}



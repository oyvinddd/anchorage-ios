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
    
    private var apiBaseUrl: URL!
    
    private var eventsUrl: URL { apiBaseUrl.appendingPathComponent("events") }
    
    private var accountUrl: URL { apiBaseUrl.appendingPathComponent("account") }
    
    init(apiBaseUrl: String, addApiAndVersionPath: Bool = true) {
        self.apiBaseUrl = URL(string: apiBaseUrl)!
    }
    
    // MARK: - Account requests
    
    func deleteAccountRequest() -> URLRequest {
        return URLRequestBuilder(.delete, url: accountUrl)
            .set(bearerToken: credentialService?.accessToken)
            .build()
    }
    
    // MARK: - Event requests
    
    func createEventRequest(event: Event) -> URLRequest {
        return URLRequestBuilder(.post, url: eventsUrl)
            .set(value: "Content-Type", for: "application/json")
            .set(bearerToken: credentialService?.accessToken)
            .set(body: event)
            .build()
    }
    
    func listEventsRequest() -> URLRequest {
        return URLRequestBuilder(.get, url: eventsUrl)
            .set(bearerToken: credentialService?.accessToken)
            .build()
    }
    
    func deleteEventRequest(eventId: UUID) -> URLRequest {
        let eventUrl = eventsUrl.appendingPathComponent(eventId.uuidString)
        return URLRequestBuilder(.delete, url: eventUrl)
            .set(bearerToken: credentialService?.accessToken)
            .build()
    }
}



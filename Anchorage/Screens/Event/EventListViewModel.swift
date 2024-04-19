//
//  EventListViewModel.swift
//  Anchorage
//
//  Created by Øyvind Hauge on 19/04/2024.
//

import Foundation

@MainActor final class EventListViewModel: ObservableObject, EventServiceInjectable {
    
    @Published var events: [Event] = []
    @Published var error: Error?
    
    func listEvents() {
        Task {
            
            do {
             
                events = try await eventService.listEvents()
                
            } catch let error {
                
                self.error = error
            }
        }
    }
}

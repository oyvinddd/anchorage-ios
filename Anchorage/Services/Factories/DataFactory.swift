//
//  DataFactory.swift
//  Anchorage
//
//  Created by Øyvind Hauge on 19/04/2024.
//

import Foundation

protocol DataFactoryInjectable {
    
    var dataFactory: DataFactory { get }
}

extension DataFactoryInjectable {
    
    var dataFactory: DataFactory { DataFactory.shared }
}

final class DataFactory {
    
    static let shared = DataFactory()
    
    var events: [Event] = [
        Event(id: UUID(), title: "Metal Concert", description: "Lorem ipsum"),
        Event(id: UUID(), title: "Flower Festival, 2024", description: "Lorem ipsum..."),
        Event(id: UUID(), title: "Parade", description: "Lorem ipsum"),
        Event(id: UUID(), title: "Pride Festival, 2023", description: "Lorem ipsum"),
        Event(id: UUID(), title: "Smalahovesleppet", description: "Lorem ipsum...")
    ]
}

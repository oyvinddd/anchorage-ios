//
//  NetworkManager.swift
//  Anchorage
//
//  Created by Øyvind Hauge on 09/04/2024.
//

import Foundation

protocol NetworkManagerInjectable {
    
    var networkManager: NetworkManager { get }
}

extension NetworkManagerInjectable {
    
    var networkManager: NetworkManager { return NetworkManager() }
}

final class NetworkManager {
    
    private let session: URLSession
    
    init(urlSession: URLSession = URLSession.shared) {
        self.session = urlSession
    }
    
    func execute<T: Decodable>(request: URLRequest) async throws -> T {
        fatalError("request() not implemented")
    }
    
    func execute(request: URLRequest) async throws {
        fatalError("request() not implemented")
    }
}

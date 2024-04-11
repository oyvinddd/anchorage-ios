//
//  AccountService.swift
//  Anchorage
//
//  Created by Øyvind Hauge on 09/04/2024.
//

import Foundation

protocol AccountServiceInjectable {
    
    var accountService: AccountService { get }
}

extension AccountServiceInjectable {
    
    var accountService: AccountService { return ServiceFactory.instance.accountService }
}

protocol AccountService {
    
    func deleteAccount() async throws
}

// MARK: - Live account service

final class LiveAccountService: AccountService, RequestFactoryInjectable, NetworkManagerInjectable {
    
    func deleteAccount() async throws {
        let request = requestFactory.deleteAccountRequest()
        return try await networkManager.execute(request: request)
    }
}

// MARK: - Mocked account service

final class MockedAccountService: AccountService {
    
    func deleteAccount() async throws {
        fatalError()
    }
}

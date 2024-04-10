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
    
    var account: Account? { get }
    
    func deleteAccount() async throws
}

// MARK: - Live account service

final class LiveAccountService: AccountService, NetworkManagerInjectable {
    
    static let shared = LiveAccountService()
    
    var account: Account?
    
    init() {
        // try loading account object from local keychain
        account = try? KeychainWrapper.load(key: "account")
    }
    
    func deleteAccount() async throws {
        let request = URLRequestBuilder("http://localhost:8888/api/v1/account").build()
        return try await networkManager.execute(request: request)
    }
}

// MARK: - Mocked account service

final class MockedAccountService: AccountService {
    
    static let shared = LiveAccountService()
    
    var account: Account?
    
    func deleteAccount() async throws {
        account = nil
    }
}

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

final class LiveAccountService: AccountService {
    
    static let shared = LiveAccountService()
    
    var account: Account?
    
    func deleteAccount() async throws {
        fatalError()
    }
}

// MARK: - Mocked account service

final class MockedAccountService: AccountService {
    
    static let shared = LiveAccountService()
    
    var account: Account?
    
    func deleteAccount() async throws {
        fatalError()
    }
}

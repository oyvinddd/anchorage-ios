//
//  ProfileViewModel.swift
//  Anchorage
//
//  Created by Øyvind Hauge on 19/04/2024.
//

import Foundation

@MainActor final class ProfileViewModel: ObservableObject, TokenServiceInjectable {
    
    @Published var shouldSignIn: Bool = false
    
    init() {
        shouldSignIn = !tokenService.authenticated
    }
    
    func signOut() {
        if tokenService.clear() {
            shouldSignIn.toggle()
        }
    }
}

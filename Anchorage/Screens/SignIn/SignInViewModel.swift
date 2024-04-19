//
//  SignInViewModel.swift
//  Anchorage
//
//  Created by Øyvind Hauge on 11/04/2024.
//

import SwiftUI
import AuthenticationServices

final class SignInViewModel: ObservableObject, AuthenticationServiceInjectable {
    
    func startAuthentication(from contextProvider: ASWebAuthenticationPresentationContextProviding, using provider: AuthenticationProvider) {
        authenticationService.startAuthentication(from: contextProvider, using: provider)
    }
}

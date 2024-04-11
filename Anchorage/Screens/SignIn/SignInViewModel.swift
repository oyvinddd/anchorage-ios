//
//  SignInViewModel.swift
//  Anchorage
//
//  Created by Øyvind Hauge on 11/04/2024.
//

import SwiftUI

enum SignInProvider {
    case google, apple
}

final class SignInViewModel: ObservableObject, AuthenticationServiceInjectable {
    
    func urlForProvider(_ provider: SignInProvider) -> URL {
        switch provider {
        case .google:
            return authenticationService.googleAuthUrl
        case .apple:
            return authenticationService.appleAuthUrl
        }
    }
}

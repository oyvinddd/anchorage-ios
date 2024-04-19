//
//  AuthenticationService.swift
//  Anchorage
//
//  Created by Øyvind Hauge on 11/04/2024.
//

import Foundation
import AuthenticationServices

protocol AuthenticationServiceInjectable {
    
    var authenticationService: AuthenticationService { get }
}

extension AuthenticationServiceInjectable {
    
    var authenticationService: AuthenticationService { ServiceFactory.instance.authenticationService }
}

protocol AuthenticationService {
    
    var googleAuthUrl: URL { get }
    
    var appleAuthUrl: URL { get }
    
    func startAuthentication(from contextProvider: ASWebAuthenticationPresentationContextProviding)
    
    func handleAuthenticationRedirect(url: URL) -> Bool
}

final class LiveAuthenticationService: AuthenticationService, RequestFactoryInjectable {

    var googleAuthUrl: URL { requestFactory.googleAuthUrl }
    
    var appleAuthUrl: URL { requestFactory.appleAuthUrl }
    
    func startAuthentication(from contextProvider: ASWebAuthenticationPresentationContextProviding) {
        let url = googleAuthUrl
        let callback = ASWebAuthenticationSession.Callback.customScheme("anchorage")
        let session = ASWebAuthenticationSession(url: url, callback: callback) { callbackUrl, error in
            
        }
        session.presentationContextProvider = contextProvider
        session.start()
    }
    
    func handleAuthenticationRedirect(url: URL) -> Bool {
        return true
    }
}

final class MockedAuthenticationService: AuthenticationService, RequestFactoryInjectable {

    var googleAuthUrl: URL { requestFactory.googleAuthUrl }
    
    var appleAuthUrl: URL { requestFactory.appleAuthUrl }
    
    func startAuthentication(from contextProvider: any ASWebAuthenticationPresentationContextProviding) {
        fatalError("not implemented")
    }
    
    func handleAuthenticationRedirect(url: URL) -> Bool {
        return true
    }
}

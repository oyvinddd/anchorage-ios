//
//  AuthenticationService.swift
//  Anchorage
//
//  Created by Øyvind Hauge on 11/04/2024.
//

import Foundation
import AuthenticationServices

enum AuthenticationProvider {
    case google, apple
}

protocol AuthenticationServiceInjectable {
    
    var authenticationService: AuthenticationService { get }
}

extension AuthenticationServiceInjectable {
    
    var authenticationService: AuthenticationService { ServiceFactory.instance.authenticationService }
}

protocol AuthenticationService {
    
    var googleAuthUrl: URL { get }
    
    var appleAuthUrl: URL { get }
    
    func startAuthentication(from contextProvider: ASWebAuthenticationPresentationContextProviding, using provider: AuthenticationProvider)
}

final class LiveAuthenticationService: AuthenticationService, TokenServiceInjectable, RequestFactoryInjectable {

    var googleAuthUrl: URL { requestFactory.googleAuthUrl }
    
    var appleAuthUrl: URL { requestFactory.appleAuthUrl }
    
    func startAuthentication(from contextProvider: ASWebAuthenticationPresentationContextProviding, using provider: AuthenticationProvider) {
        let authUrl = provider == .google ? googleAuthUrl : appleAuthUrl
        let callback = ASWebAuthenticationSession.Callback.customScheme("anchorage")
        
        let session = ASWebAuthenticationSession(url: authUrl, callback: callback, completionHandler: handleAuthenticationCallback)
        session.presentationContextProvider = contextProvider
        session.start()
    }
    
    private func handleAuthenticationCallback(_ callbackUrl: URL?, error: Error?) {
        guard let url = callbackUrl, let components = URLComponents(url: url, resolvingAgainstBaseURL: true) else {
            return
        }
        
        guard let queryItems = components.queryItems else {
            return
        }
        
        // extract access and refresh tokens from the redirect url
        let accessToken = queryItems.first(where: { $0.name == "access_token" })?.value
        let refreshToken = queryItems.first(where: { $0.name == "refresh_token" })?.value
        
        // we can now store the refresh and access tokens in the iOS keychain for later use
        _ = tokenService.store(tokens: TokenContainer(accessToken, refreshToken))
        
        // lastly, we notify the system that the user was successfully authenticated
        NotificationCenter.default.post(name: .signInSuccess)
    }
}

final class MockedAuthenticationService: AuthenticationService, RequestFactoryInjectable {

    var googleAuthUrl: URL { requestFactory.googleAuthUrl }
    
    var appleAuthUrl: URL { requestFactory.appleAuthUrl }
    
    func startAuthentication(from contextProvider: ASWebAuthenticationPresentationContextProviding, using provider: AuthenticationProvider) {
        fatalError("not implemented")
    }
}

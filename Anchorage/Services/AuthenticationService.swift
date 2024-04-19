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

final class LiveAuthenticationService: AuthenticationService, RequestFactoryInjectable {

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
        
        // extract access token from the redirect url
        let accessToken = components.queryItems?.first(where: { $0.name == "access_token" })?.value
    }
}

final class MockedAuthenticationService: AuthenticationService, RequestFactoryInjectable {

    var googleAuthUrl: URL { requestFactory.googleAuthUrl }
    
    var appleAuthUrl: URL { requestFactory.appleAuthUrl }
    
    func startAuthentication(from contextProvider: ASWebAuthenticationPresentationContextProviding, using provider: AuthenticationProvider) {
        fatalError("not implemented")
    }
}

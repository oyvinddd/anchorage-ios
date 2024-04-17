//
//  AppDelegate.swift
//  Anchorage
//
//  Created by Øyvind Hauge on 10/04/2024.
//

import UIKit

final class AppDelegate: NSObject, UIApplicationDelegate, AuthenticationServiceInjectable {
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        return true
    }
    
    func application(_ app: UIApplication, open url: URL, options: [UIApplication.OpenURLOptionsKey : Any] = [:]) -> Bool {
        return authenticationService.handleAuthenticationRedirect(url: url)
    }
}

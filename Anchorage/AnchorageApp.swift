//
//  AnchorageApp.swift
//  Anchorage
//
//  Created by Øyvind Hauge on 09/04/2024.
//

import SwiftUI

@main
struct AnchorageApp: App {
    
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    
    var body: some Scene {
        WindowGroup {
            SignInView()
                .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
    }
}

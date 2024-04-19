//
//  NotificationCenter+Custom.swift
//  Anchorage
//
//  Created by Øyvind Hauge on 19/04/2024.
//

import UIKit

extension Notification.Name {
    
    static let signInSuccess = Notification.Name("SignInSuccess")
}

extension NotificationCenter {
    
    func post(name: Notification.Name) {
        post(name: name, object: nil)
    }
}

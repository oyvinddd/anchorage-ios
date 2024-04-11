//
//  AppSettings.swift
//  Anchorage
//
//  Created by Øyvind Hauge on 10/04/2024.
//

import Foundation

struct AppSettings {
    
    private struct Keys {
        
        static let apiBaseUrl = "ApiBaseUrl"
    }
    
    private static var infoDictionary: [String: Any] = Bundle.main.infoDictionary ?? [:]
    
    static var apiBaseUrl: String { (infoDictionary[Keys.apiBaseUrl] as? String) ?? "" }
}

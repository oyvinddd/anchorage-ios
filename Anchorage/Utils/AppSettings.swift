//
//  AppSettings.swift
//  Anchorage
//
//  Created by Øyvind Hauge on 10/04/2024.
//

import Foundation

struct AppSettings {
    
    private enum SettingKey: String {
        
        case apiBaseUrl
    }
    
    private static var infoDictionary: [String: Any] = Bundle.main.infoDictionary ?? [:]
    
    static var apiBaseUrl: String { (infoDictionary[SettingKey.apiBaseUrl.rawValue] as? String) ?? "" }
}

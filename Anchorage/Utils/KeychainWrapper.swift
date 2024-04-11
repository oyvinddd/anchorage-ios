//
//  KeychainWrapper.swift
//  Anchorage
//
//  Created by Øyvind Hauge on 10/04/2024.
//

import Foundation
import Security

struct KeychainWrapper {
    
    private static let appName = "anchorage"
    
    static func store<T: Codable>(_ object: T, for key: String) throws -> Bool {
        
        let data = try JSONEncoder().encode(object)
        let query: [String: Any] = [
            kSecClass as String: kSecClassIdentity,
            kSecAttrService as String: key,
            kSecAttrAccount as String: appName,
            kSecValueData as String: data
        ]
        
        let status = SecItemAdd(query as CFDictionary, nil)
        return status == errSecSuccess
    }
    
    static func load<T: Codable>(key: String) throws -> T? {
        
        let query: [String: Any] = [
            kSecClass as String: kSecClassIdentity,
            kSecAttrService as String: key,
            kSecAttrAccount as String: appName,
            kSecReturnData as String: true
        ]
        
        var result: AnyObject?
        SecItemCopyMatching(query as CFDictionary, &result)
        
        guard let data = result as? Data else {
            return nil
        }
        
        return try JSONDecoder().decode(T.self, from: data)
    }
}
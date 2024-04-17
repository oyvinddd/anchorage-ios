//
//  Bundle+Version.swift
//  Anchorage
//
//  Created by Øyvind Hauge on 17/04/2024.
//

import Foundation

extension Bundle {
    
    var appName: String { infoDictionary?["CFBundleName"] as? String ?? "" }
    
    var versionNumber: String { infoDictionary?["CFBundleShortVersionString"] as? String ?? "" }
    
    var buildNumber: String { infoDictionary?["CFBundleVersion"] as? String ?? "" }
    
    var appNameAndVersion: String { "\(appName) \(versionNumber) (\(buildNumber))" }
}

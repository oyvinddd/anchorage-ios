//
//  Color+App.swift
//  Anchorage
//
//  Created by Øyvind Hauge on 19/04/2024.
//

import SwiftUI

extension Color {
    
    init(hex: UInt, alpha: Double = 1) {
        
        let r = Double((hex >> 16) & 0xff) / 255
        let g = Double((hex >> 08) & 0xff) / 255
        let b = Double((hex >> 00) & 0xff) / 255
        
        self.init(.sRGB, red: r, green: g, blue: b, opacity: alpha)
    }
    
    struct App {
        
        static let primary = Color(hex: 0x5C3DDE)
        
        static let background = Color(hex: 0xF3F5FA)
        
        static let primaryText = Color(hex: 0x1D2236)
        
        static let secondaryText = Color(hex: 0x6E717F)
        
        static let textField = Color(hex: 0xE6E8ED)
    }
}

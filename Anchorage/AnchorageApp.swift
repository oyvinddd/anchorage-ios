//
//  AnchorageApp.swift
//  Anchorage
//
//  Created by Øyvind Hauge on 09/04/2024.
//

import SwiftUI

@main
struct AnchorageApp: App {
    var body: some Scene {
        WindowGroup {
            ZStack {
                Text("Hello, world!")
                    .frame(maxWidth: .infinity)
                    .padding(.horizontal, 32)
                    .foregroundStyle(Color.black)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color.white)
        }
    }
}

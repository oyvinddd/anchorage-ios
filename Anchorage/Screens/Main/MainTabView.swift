//
//  MainTabView.swift
//  Anchorage
//
//  Created by Øyvind Hauge on 19/04/2024.
//

import SwiftUI

struct MainTabView: View {
    
    var body: some View {
        
        TabView {
            
            Text("1")
                .tabItem {
                    EventListView()
                }
            
            Text("2")
                .tabItem {
                    CameraView()
                }
            
            Text("3")
                .tabItem {
                    ProfileView()
                }
        }
    }
}

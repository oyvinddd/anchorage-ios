//
//  SignInView.swift
//  Anchorage
//
//  Created by Øyvind Hauge on 11/04/2024.
//

import SwiftUI

struct SignInView: View {
    
    var body: some View {
        
        VStack (spacing: 16) {
            
            Spacer()
            
            Button("Sign in Using Apple") {
                
            }
            .foregroundStyle(.blue)
            
            Button("Sign in Using Google") {
                
            }
            .foregroundStyle(.yellow)
            
            Spacer()
        }
        .padding(.horizontal, 32)
    }
}

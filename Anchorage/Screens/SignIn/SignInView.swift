//
//  SignInView.swift
//  Anchorage
//
//  Created by Øyvind Hauge on 11/04/2024.
//

import SwiftUI

struct SignInView: View {
    
    @StateObject var viewModel = SignInViewModel()
    @State private var presentWebView: Bool = false
    
    var body: some View {
        
        VStack (spacing: 16) {
            
            Spacer()
            
            Button("Sign in Using Apple") {
                presentWebView.toggle()
            }
            .foregroundStyle(.blue)
            
            Button("Sign in Using Google") {
                presentWebView.toggle()
            }
            .foregroundStyle(.yellow)
            
            Spacer()
        }
        .padding(.horizontal, 32)
        .sheet(isPresented: $presentWebView) {
            WebView(url: viewModel.urlForProvider(.google))
                .interactiveDismissDisabled()
                .ignoresSafeArea(.all)
        }
    }
}

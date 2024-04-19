//
//  ProfileView.swift
//  Anchorage
//
//  Created by Øyvind Hauge on 19/04/2024.
//

import SwiftUI

struct ProfileView: View {
    
    @StateObject var viewModel: ProfileViewModel = ProfileViewModel()
    
    var body: some View {
        
        VStack {
            Text("Secret Area!")
                .font(Font.system(size: 32, weight: .bold))
                .frame(maxWidth: .infinity)
                .padding(.horizontal, 16)
        }
        .sheet(isPresented: $viewModel.shouldSignIn, content: {
            SignInView().ignoresSafeArea(.all)
        })
    }
}

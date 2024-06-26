//
//  EventListView.swift
//  Anchorage
//
//  Created by Øyvind Hauge on 19/04/2024.
//

import SwiftUI

struct EventListView: View {
    
    @StateObject var viewModel: EventListViewModel = EventListViewModel()
    
    var body: some View {
        
        NavigationStack {
            List(viewModel.events, id: \.id) { event in
                
                Text(event.title)
                    .foregroundStyle(Color.App.primaryText)
            }
            .navigationTitle("My Events")
        }
        .onAppear {
            viewModel.listEvents()
        }
    }
}

//
//  UserLibraryView.swift
//  CloudBusting
//
//  Created by Ben Cuello-Wolffe on 7/24/24.
//

import SwiftUI

struct UserLibraryView: View {
    var body: some View {
        NavigationStack {
            
            ZStack {
                Color(UIColor.systemBackground).ignoresSafeArea()
                
                LinearGradient(stops: [
                    .init(color: .darkColor1, location: 0.1),
                    .init(color: .clear, location: 0.5)
                ], startPoint: .topLeading, endPoint: .bottomTrailing)
                    .ignoresSafeArea()
                
                
                
                VStack {
                    LibraryListView
                    
                    
                }
            }
            .navigationTitle("Library")
            
        }
    }
}

extension UserLibraryView {
    
    private var LibraryListView: some View {
        List {
            HStack {
                Image(systemName: "cloud.fill")
                    .foregroundStyle(.lightColor1)
                
                Text("Your Clouds")
                    .padding(3)
                
                Spacer()
                
                Image(systemName: "chevron.right")
                    .foregroundStyle(.interactiveSymbol)
            }
            .padding(.vertical)
            .listRowBackground(Color.clear)
            
            HStack {
                Image(systemName: "heart.fill")
                    .foregroundStyle(.lightColor1)
                
                Text("Wishlists")
                    .padding(3)
                
                Spacer()
                
                Image(systemName: "chevron.right")
                    .foregroundStyle(.interactiveSymbol)
            }
            .padding(.vertical)
            .listRowBackground(Color.clear)
            
            HStack {
                Image(systemName: "bookmark.fill")
                    .foregroundStyle(.lightColor1)
                
                Text("Saved Articles")
                    .padding(3)
                
                Spacer()
                
                Image(systemName: "chevron.right")
                    .foregroundStyle(.interactiveSymbol)
            }
            .padding(.vertical)
            .listRowBackground(Color.clear)
        }
        .font(.title2)
        .fontWeight(.semibold)
        .listStyle(.plain)
        .scrollDisabled(true)
        .padding(.top)
    }
    
}

#Preview {
    UserLibraryView()
}

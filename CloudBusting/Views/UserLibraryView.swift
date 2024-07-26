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
                
                
                ScrollView {
                    VStack(spacing: 20) {
                        LibraryListView
                            .padding(.bottom)
                        
                        LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())]) {
                            ForEach(0..<8) { _ in
                                Rectangle()
                                    .frame(height: 100)
                            }
                        }
                        .padding()
                    }
                }
            }
            .navigationTitle("Library")
            
        }
    }
}

extension UserLibraryView {
    
    private var LibraryListView: some View {
        LazyVStack {
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
            .padding(.leading)
            .padding(.trailing)
            
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
            .padding(.leading)
            .padding(.trailing)
            
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
            .padding(.leading)
            .padding(.trailing)
        }
        .font(.title2)
        .fontWeight(.semibold)
        .padding(.top)
    }
    
}

#Preview {
    UserLibraryView()
}

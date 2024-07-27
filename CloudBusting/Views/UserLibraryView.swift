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
                BlurredGradientBackgroundView()
                
                
                ScrollView {
                    VStack(spacing: 20) {
                        LibraryListView
                        
                        Text("Recently Scanned")
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .font(.title)
                            .bold()
                            .padding(.horizontal)
                        
                        LazyVGrid(columns: [GridItem(.flexible(), spacing: 20), GridItem(.flexible(), spacing: 20)], spacing: 20) {
                            ForEach(0..<8) { _ in
                                VStack {
                                    Rectangle()
                                        .aspectRatio(1, contentMode: .fit)
                                        .overlay(
                                            Image("Cumulus5")
                                                .resizable()
                                                .scaledToFill()
                                        )
                                        .clipShape(RoundedRectangle(cornerRadius: 10))
                                    
                                    Text("Cumulus")
                                        .frame(maxWidth: .infinity, alignment: .leading)
                                        .font(.footnote)
                                    
                                    Text("Jul 27")
                                        .frame(maxWidth: .infinity, alignment: .leading)
                                        .font(.footnote)
                                        .foregroundStyle(.interactiveSymbol)
                                }
                            }
                        }
                        .padding(.horizontal)
                    }
                }
            }
            .navigationTitle("Library")
            .toolbarBackground(.ultraThinMaterial, for: .navigationBar)
            
        }
    }
}

extension UserLibraryView {
    
    private var LibraryListView: some View {
        VStack {
            HStack {
                Image(systemName: "cloud.fill")
                    .foregroundStyle(.highlight)
                
                
                
                Text("Your Clouds")
                    .padding(3)
                
                Spacer()
                
                Image(systemName: "chevron.right")
                    .foregroundStyle(.interactiveSymbol)
            }
            .padding(.vertical, 5)
            .padding(.leading, 15)
            .padding(.trailing)
            
            Divider()
                .padding(.leading, 50)
            
            HStack {
                Image(systemName: "heart.fill")
                    .foregroundStyle(.highlight)
                
                Text("Wishlists")
                    .padding(3)
                
                Spacer()
                
                Image(systemName: "chevron.right")
                    .foregroundStyle(.interactiveSymbol)
            }
            .padding(.vertical, 5)
            .padding(.leading, 16)
            .padding(.trailing)
            
            Divider()
                .padding(.leading, 50)
                .foregroundStyle(.interactiveSymbol)
            
            HStack {
                Image(systemName: "bookmark.fill")
                    .foregroundStyle(.highlight)
                
                Text("Saved Articles")
                    .padding(3)
                
                Spacer()
                
                Image(systemName: "chevron.right")
                    .foregroundStyle(.interactiveSymbol)
            }
            .padding(.vertical, 5)
            .padding(.leading, 18)
            .padding(.trailing)
            
            Divider()
                .padding(.leading, 50)
        }
        .font(.title2)
        .fontWeight(.semibold)
    }
    
}

#Preview {
    UserLibraryView()
}

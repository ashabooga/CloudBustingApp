//
//  ContentView.swift
//  CloudBusting
//
//  Created by Ben Cuello-Wolffe on 6/29/24.
//

import SwiftUI

struct HomeView: View {
    
    var body: some View {
        
        NavigationStack {
            ZStack {
                
                Color.darkColor1.ignoresSafeArea()
                
                LinearGradient(gradient: Gradient(colors: [Color.lightColor1, Color.clear]), startPoint: .topLeading, endPoint: .bottomTrailing)
                    .ignoresSafeArea()
                
                ScrollView {
                    VStack {
                        
                        RoundedRectangle(cornerRadius: 10)
                            .frame(width: 360, height: 50)
                            .foregroundStyle(.bar)
                            .shadow(radius: 2, y: 3)
                        
                        Text("Popular Clouds")
                            .font(.title)
                            .bold()
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding(.horizontal, 20)
                            .padding(.top, 25)
                        
                        
                        
                        Text("Cloud of the Day")
                            .font(.title)
                            .bold()
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding(.horizontal, 20)
                            .padding(.top, 25)
                        
                        CloudOfTheDayThumbnailButtonView(cloud: CloudModel.Cumulus)
                            .padding()
                        
                        Text("Articles")
                            .font(.title)
                            .bold()
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding(.horizontal, 20)
                            .padding(.top, 25)
                        
                        ScrollView(.horizontal, showsIndicators: false) {
                            LazyHStack {
                                ForEach(0..<10) { _ in
                                    ArticleThumbnailButtonView(article: ArticleModel.noArticle)
                                }
                                .padding(.horizontal, 5)
                            }
                            .padding()
                        }
                        
                        
                        Spacer()
                    }
                }
                .navigationTitle("CloudBusting")
            .navigationBarTitleDisplayMode(.large)
            }
        }
    }
}

#Preview {
    HomeView()
}

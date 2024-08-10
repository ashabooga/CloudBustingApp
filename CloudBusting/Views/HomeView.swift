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
                
                Color.testDark.ignoresSafeArea()
                
                LinearGradient(stops: [
                    .init(color: .testLight, location: 0),
                    .init(color: .clear, location: 0.35)
                ], startPoint: .top, endPoint: .bottom)
                .ignoresSafeArea()
                
                ScrollView {
                    VStack {
                        
                        RoundedRectangle(cornerRadius: 10)
                            .frame(width: 360, height: 50)
                            .foregroundStyle(.bar)
                            .shadow(radius: 2, y: 3)
                            .padding(.bottom)
                        
                        HStack {
                            Text("Popular Clouds")
                                .foregroundStyle(.interactiveText)
                            
                            Image(systemName: "chevron.right")
                                .font(.title2)
                                .foregroundStyle(.interactiveSymbol)
                            
                            Spacer()
                        }
                        .font(.title)
                        .bold()
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.leading, 25)
                        
                        ScrollView(.horizontal, showsIndicators: false) {
                            LazyHStack {
                                ForEach(0..<10) { _ in
                                    PopularCloudsIconView(cloud: CloudModel.Cumulus)
                                }
                                .padding(.horizontal, 5)
                            }
                            .scrollTargetLayout()
                            .padding(.horizontal)
                        }
                        .scrollTargetBehavior(.viewAligned)
                        
                        Text("Cloud of the Day")
                            .font(.title)
                            .bold()
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding(.horizontal, 25)
                            .padding(.top)
                        
                        
                        NavigationLink {
                            CloudInfoCardView(cloud: CloudModel.Cumulus)
                        } label: {
                            CloudOfTheDayThumbnailView(cloud: CloudModel.Mamma)
                                .padding(.horizontal)
                                .padding(.bottom)
                        }

                        HStack {
                            Text("Articles")
                                .foregroundStyle(.interactiveText)
                            
                            Image(systemName: "chevron.right")
                                .font(.title2)
                                .foregroundStyle(.interactiveSymbol)
                            
                            Spacer()
                        }
                        .font(.title)
                        .bold()
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.leading, 25)
                        
                        ScrollView(.horizontal, showsIndicators: false) {
                            LazyHStack {
                                ForEach(0..<10) { _ in
                                    ArticleThumbnailButtonView(article: ArticleModel.noArticle)
                                }
                                .padding(.horizontal, 5)
                            }
                            .scrollTargetLayout()
                            .padding(.horizontal)
                        }
                        .scrollTargetBehavior(.viewAligned)
                        
                        
                        Text("Cloud Forecast")
                            .font(.title)
                            .bold()
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding(.horizontal, 25)
                            .padding(.top)
                        
                        Spacer()
                    }
                }
                .navigationTitle("CloudBusting")
            .navigationBarTitleDisplayMode(.large)
            }
        }
    }
}

struct CloudOfTheDayThumbnailView: View {
    
    let cloud: CloudModel
    
    var body: some View {
        ZStack {
            Image(cloud.cloudOfTheDayImage)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 350, height: 450)
//                .offset(y: 20)
                .clipped()
                .glur(offset: 0.7, interpolation: 0.4)
            
            VStack {
                Spacer()
                Text(cloud.name)
                    .font(.largeTitle)
                    .bold()
                    .foregroundStyle(.white)
                    .padding(.vertical)
            }
        }
        .clipShape(RoundedRectangle(cornerRadius: 15))
//        .shadow(radius: 15)
    }
}

struct PopularCloudsIconView: View {
    
    var cloud: CloudModel
    
    var body: some View {
        ZStack {
            Image(cloud.cloudOfTheDayImage)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 250, height: 200)
                .clipped()
                .glur(offset: 0.45, interpolation: 0.6)
            
            VStack {
                Spacer()

                Text(cloud.name)
                    .font(.title2)
                    .bold()
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.leading, 25)
                    .padding(.top)
                    .foregroundStyle(.testText)
                    .padding(.bottom)
            }
            
            
        }
        .clipShape(RoundedRectangle(cornerRadius: 15))
//        .shadow(radius: 10)
    }
}

#Preview {
    HomeView()
}

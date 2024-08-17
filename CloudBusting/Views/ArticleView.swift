//
//  ArticleView.swift
//  CloudBusting
//
//  Created by Ben Cuello-Wolffe on 8/16/24.
//

import SwiftUI

struct ArticleView: View {
    
    var article: ArticleModel
    
    var body: some View {
        EmptyView()
    }
}

struct ArticleThumbnailView: View {
    
    var article: ArticleModel
    
    var body: some View {
        Rectangle()
            .aspectRatio(0.65, contentMode: .fit)
            .foregroundStyle(Color.fill)
            .overlay {
                VStack(spacing: 0) {
                    article.image
                        .resizable()
                        .scaledToFill()
                        .frame(height: 125)
                        .clipped()
                    
                    HStack {
                        Text("Best Of")
                            .foregroundStyle(.highlight)
                            .font(.callout)
                            .fontWeight(.heavy)
                            .padding(.leading, 5)
                        
                        Spacer()
                    }
                    .frame(maxWidth: .infinity)
                    .padding(8)
                    .background(LinearGradient(stops: [
                        .init(color: .white.opacity(0.1), location: 0),
                        .init(color: .clear, location: 0.5)
                    ], startPoint: .leading, endPoint: .trailing))
                    
                    Text(article.title)
                        .font(.title3)
                        .fontWeight(.bold)
                        .padding(.top)
                        .padding(.horizontal)
                        .foregroundStyle(.testText)
                    
                    Spacer()
                    
                    Divider()
                    
                    HStack {
                        Spacer()
                        
                        Menu {
                            Button {
                                print("like this article")
                            } label: {
                                Label("Like this Article", systemImage: "hand.thumbsup.fill")
                                    .foregroundStyle(.red)
                            }
                            
                            Button {
                                print("dislike this article")
                            } label: {
                                Label("Dislike this Article", systemImage: "hand.thumbsdown.fill")
                                    .foregroundStyle(.red)
                            }
                            
                            Button {
                                print("Save Article")
                            } label: {
                                Label("Save Article", systemImage: "bookmark.fill")
                            }

                        } label: {
                            Image(systemName: "ellipsis")
                                .foregroundStyle(.testText)
                                .font(.title3)
                        }
                    }
                    .padding()
                    
                }
            }
            .clipShape(RoundedRectangle(cornerRadius: 15))
    }
}

#Preview {
    ArticleThumbnailView(article: ArticleModel.noArticle)
        .frame(width: 200)
}

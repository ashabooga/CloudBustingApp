//
//  CloudInfoCardView.swift
//  CloudBusting
//
//  Created by Ben Cuello-Wolffe on 7/3/24.
//

import SwiftUI

struct CloudInfoCardView: View {
    
    let cloud: CloudModel
    @State private var sheetHeight: CGFloat = 0
    @State private var showingSheet: Bool = true
    
    let heights = stride(from: 0.25, through: 0.99, by: 0.01).map { PresentationDetent.fraction($0) }
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                
                Image(cloud.images[0])
                    .resizable()
                    .scaledToFit()
                    .frame(width: geometry.size.width, height: geometry.size.height - self.sheetHeight)
                    .clipped()
                
                    .sheet(isPresented: $showingSheet, content: {
                        CloudInfoView(cloud: cloud, height: $sheetHeight)
                            .interactiveDismissDisabled()
                            .presentationDetents(Set(heights))
                    })
                Text(geometry.size.height.description)
            }
        }
    }
}

struct CloudInfoView: View {
    
    let cloud: CloudModel
    @Binding var height: CGFloat
    
    var body: some View {
        
        GeometryReader { geometry in
            
            ZStack {
                
                Color.darkColor1.ignoresSafeArea()
                
                LinearGradient(gradient: Gradient(colors: [Color.lightColor1, Color.clear]), startPoint: .topLeading, endPoint: .bottomTrailing)
                    .ignoresSafeArea()
                
                ScrollView {
                    VStack {
                        
                        HStack {
                            Text(cloud.name)
                                .font(.largeTitle)
                                .bold()
                            
                            Text("Rare")
                                .font(.title2)
                                .bold()
                                .padding(5)
                                .padding(.horizontal, 5)
                                .background {
                                    RoundedRectangle(cornerRadius: 5)
                                        .foregroundStyle(.orange)
                                }
                            
                            
                            Spacer()
                        }
                        .padding(.top, 40)
                        .padding(.horizontal, 25)
                        
                        
                        
                        Text("Images")
                            .font(.title)
                            .bold()
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding(.horizontal, 25)
                        
                        ScrollView(.horizontal, content: {
                            LazyHStack(content: {
                                ForEach(1..<cloud.images.count, id: \.self) { count in
                                    Image(cloud.images[count])
                                        .resizable()
                                        .scaledToFill()
                                        .clipped()
                                        .frame(width: 225, height: 175)
                                        .clipShape(RoundedRectangle(cornerRadius: 15))
                                }
                                .padding(.horizontal, 5)
                            })
                            .padding()
                        })
                        .scrollIndicators(.hidden)
                        
                        
                    }
                }
            }
        }
    }
}

#Preview {
    CloudInfoCardView(cloud: CloudModel.Cumulus)
}

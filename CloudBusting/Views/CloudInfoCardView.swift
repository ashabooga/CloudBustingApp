//
//  CloudInfoCardView.swift
//  CloudBusting
//
//  Created by Ben Cuello-Wolffe on 7/3/24.
//

import SwiftUI

struct CloudInfoCardView: View {
    
    let cloud: CloudModel
    @State private var offset: CGFloat = 0
    
    var body: some View {
        ZStack(alignment: .top) {
            Image("Cindy-Otter")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(height: 300 + max(0, -offset))
                .clipped()
                .transformEffect(.init(translationX: 0, y: -(max(0, offset))))
                .ignoresSafeArea()
            
            if #available(iOS 18.0, *) {
                ScrollView {
                    
                    Rectangle()
                        .fill(Color.clear)
                        .frame(height: 200)
                    
                    CloudInfoView(cloud: cloud)
                        .clipShape(
                            .rect(topLeadingRadius: 25, topTrailingRadius: 25)
                        )
                        .ignoresSafeArea()
                }
                .onScrollGeometryChange(for: CGFloat.self, of: { geo in
                    return geo.contentOffset.y + geo.contentInsets.top
                }, action: { new, old in
                    offset = new
                })
            } else {
                
            }
        }
    }
}

struct TestView: View {
    var body: some View {
        LazyVStack(alignment: .leading) {
            ForEach(0..<100, id: \.self) { item in
                Text("Item at \(item)")
            }
        }
    }
}

struct CloudInfoView: View {
    
    let cloud: CloudModel
    
    var body: some View {
            
        ZStack {
            Color.darkColor1.ignoresSafeArea()
            
            LinearGradient(gradient: Gradient(colors: [Color.lightColor1, Color.clear]), startPoint: .topLeading, endPoint: .bottomTrailing)
                .ignoresSafeArea()
            
            VStack {
                
                overviewTitle
                
                Divider()
                    .frame(width: 350)
                    .padding(.bottom)
                
                ExpandableTextView(text: cloud.aboutInfo)
                    .padding(.horizontal)
                
                imagesTitle
                
                imagesSection
                
                keyInformationTitle
                
                keyInformationSection
                
                Text("Weather 🌧️")
                    .font(.title)
                    .bold()
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.leading, 25)
                    .padding(.top)
                
                
                
                
                
                TestView()
            }
        }
        .frame(maxHeight: .infinity)
    }
}

extension CloudInfoView {
    
    private var overviewTitle: some View {
        HStack {
            Text(cloud.name)
                .font(.largeTitle)
                .bold()
            
            Text("Common")
                .font(.title2)
                .bold()
                .padding(5)
                .padding(.horizontal, 5)
                .background {
                    RoundedRectangle(cornerRadius: 5)
                        .foregroundStyle(.teal)
                }
            
            
            Spacer()
        }
        .padding(.top, 40)
        .padding(.horizontal, 25)
        .frame(maxHeight: 100)
    }
    
    private var imagesTitle: some View {
        Text("Images 📸")
            .font(.title)
            .bold()
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.leading, 25)
    }
    
    private var imagesSection: some View {
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
        .frame(maxHeight: 200)
    }
    
    private var keyInformationTitle: some View {
        Text("Key Information ☁️")
            .font(.title)
            .bold()
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.leading, 25)
            .padding(.top)
    }
    
    private var keyInformationSection: some View {
        VStack {
            
            Text("The Cumulus cloud stays at low altitudes with potential to go higher, has a low precipitation chance, and is light gray in color.")
                .font(.callout)
                .foregroundColor(Color.gray)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding()
                .background {
                    RoundedRectangle(cornerRadius: 15)
                        .foregroundStyle(.darkColor1)
                }
                .padding(.horizontal)
                .fixedSize(horizontal: false, vertical: true)
            
            HStack {
                VStack {
                    HStack {
                        Image(systemName: "barometer")
                        
                        Text("Altitude")
                            .font(.headline)
                            .bold()
                        
                        Spacer()
                    }
                    .foregroundStyle(.black)
                    .opacity(0.5)
                    .padding()
                    
                    Spacer()
                }
                .frame(width: 175, height: 370)
                .background(Color.darkColor1)
                .clipShape(RoundedRectangle(cornerRadius: 25))
                .padding(.trailing, 5)
                
                
                
                VStack {
                    VStack {
                        HStack {
                            Image(systemName: "drop")
                            
                            Text("Precipitation")
                                .font(.headline)
                                .bold()
                            
                            Spacer()
                        }
                        .foregroundStyle(.black)
                        .opacity(0.5)
                        .padding()
                        
                        Gauge(value: 10, in: 0...100) {
                            Image(systemName: "umbrella.fill")
                        } currentValueLabel: {
                            Text("Unlikely")
                        }
                        .gaugeStyle(.accessoryCircular)
                        .frame(width: 100, height: 100)
                        
                        Spacer()

                        
                    }
                    .frame(width: 175, height: 175)
                    .background(Color.darkColor1)
                    .clipShape(RoundedRectangle(cornerRadius: 25))
                    .padding(.bottom, 5)
                    
                    VStack {
                        HStack {
                            Image(systemName: "smoke")
                            
                            Text("Color")
                                .font(.headline)
                                .bold()
                            
                            Spacer()
                        }
                        .foregroundStyle(.black)
                        .opacity(0.5)
                        .padding()
                        
                        Spacer()
                        
                    }
                    .frame(width: 175, height: 175)
                    .background(Color.darkColor1)
                    .clipShape(RoundedRectangle(cornerRadius: 25))
                    .padding(.top, 5)
                }
                .padding(.leading, 5)
                
            }
            .padding()
            .frame(height: 400)
        }
    }
    
}

#Preview {
    CloudInfoCardView(cloud: CloudModel.Cumulus)
}

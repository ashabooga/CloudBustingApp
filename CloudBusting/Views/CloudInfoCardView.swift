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
            
            Color.darkColor1.ignoresSafeArea()
            
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
                        .padding(.bottom, 25)
                }
                .ignoresSafeArea(edges: .bottom)
                .frame(maxHeight: .infinity)
//                .onScrollGeometryChange(for: CGFloat.self, of: { geo in
//                    return geo.contentOffset.y + geo.contentInsets.top
//                }, action: { new, old in
//                    offset = new
//                })
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
            
            LazyVStack {
                
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
                
                identificationTitle
                
                identificationSection
                
                similarCloudsTitle
                
                similarCloudsSection
                
                lookOutForTitle
                
                formationAndDevelopmentTitle
                
                historicalInformationTitle
                
                associatedArticlesTitle
                
                
                
                
                
                
//                TestView()
            }
        }
    }
}

struct CloudIdentificationViewRow: View {
    
    let SFSymbol: String
    let title: String
    let content: String
    
    var body: some View {
        VStack {
            VStack {
                HStack {
                    Image(systemName: SFSymbol)
                    
                    Text(title)
                        .bold()
                    
                    Spacer()
                }
                .font(.title3)
                .foregroundStyle(.black)
                .opacity(0.5)
            }
            .padding()
            
            Text(content)
                .paragraphText()
                .padding(.horizontal)
        }
        .padding(.horizontal)
        .padding(.bottom)
    }
}

struct SimilarCloudCardView: View {
    
    let image: String
    let name: String
    let description: String
    
    var body: some View {
        
        
        ZStack {
            
            ColoredGlassView(centerUnitPoint: .top, radius: 1500)
                .ignoresSafeArea()
            
            VStack {
                Image(image)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(height: 200)
                    .clipped()
                
                HStack {
                    Image(systemName: "exclamationmark.triangle.fill")
                    
                    Text(name)

                    Spacer()
                }
                .font(.title2)
                .bold()
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.leading, 25)
                .padding(.top)
                
                Text(description)
                    .paragraphText()
                    .padding(.horizontal, 25)
                    .padding(.vertical, 10)
                
            }
            .padding(.bottom)
        }
        .clipShape(RoundedRectangle(cornerRadius: 25))
        .shadow(radius: 10)
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
        HStack {
            Text("Images 📸")
                
            Spacer()
            
            Image(systemName: "chevron.right")
                .padding(.trailing)
                .font(.title2)
                .foregroundStyle(.interactiveText)
        }
        .font(.title)
        .bold()
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(.leading, 25)
    }
    
    private var imagesSection: some View {
        ScrollView(.horizontal, content: {
            LazyHStack(spacing: 0, content: {
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
            .scrollTargetLayout()
            .padding(.horizontal)
        })
        .scrollIndicators(.hidden)
        .scrollTargetBehavior(.viewAligned)
        .padding(.bottom)
    }
    
    private var keyInformationTitle: some View {
        Text("Key Information ℹ️")
            .font(.title)
            .bold()
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.leading, 25)
            .padding(.top)
    }
    
    private var keyInformationSection: some View {
        VStack {
            
            Text("The Cumulus cloud stays at low altitudes with potential to go higher, has a low precipitation chance, and is white to light gray in color.")
                .paragraphText()
                .padding()
                .background (ColoredGlassView(centerUnitPoint: .topLeading, radius: 1500))
                .clipShape(RoundedRectangle(cornerRadius: 25))
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
                .background(ColoredGlassView(centerUnitPoint: .topLeading, radius: 1500))
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
                        
                        Spacer()
                        
                        Gauge(value: 10, in: 0...100) {
                            Image(systemName: "umbrella.fill")
                        } currentValueLabel: {
                            Text("Unlikely")
                        }
                        .gaugeStyle(.accessoryCircular)
                        .padding(.bottom)
                        
                        Spacer()

                        
                    }
                    .frame(width: 175, height: 175)
                    .background(ColoredGlassView(centerUnitPoint: .topLeading, radius: 700))
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
                        
                        Image(systemName: "cloud.fill")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 100)
                            .foregroundStyle(.linearGradient(colors: [.white, .gray], startPoint: .leading, endPoint: .trailing))
                            .shadow(radius: 10)
                            .padding(.bottom, 25)
                        
                        Spacer()
                        
                    }
                    .frame(width: 175, height: 175)
                    .background(ColoredGlassView(centerUnitPoint: .topLeading, radius: 700))
                    .clipShape(RoundedRectangle(cornerRadius: 25))
                    .padding(.top, 5)
                }
                .padding(.leading, 5)
                
            }
            .padding()
            .frame(height: 400)
        }
    }
    
    private var identificationTitle: some View {
        Text("Identification ⛅️")
            .font(.title)
            .bold()
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.leading, 25)
            .padding(.top)
    }
    
    private var identificationSection: some View {
        VStack {
            CloudIdentificationViewRow(SFSymbol: "cloud.circle", title: "Shape", content: "Fluffy, cotton-like appearance with a clearly defined base.")
                .padding(.top)
            
            Divider()
                .frame(width: 300)
            
            CloudIdentificationViewRow(SFSymbol: "viewfinder", title: "Edges", content: "Rounded and well-defined.")
            
            Divider()
                .frame(width: 300)
            
            CloudIdentificationViewRow(SFSymbol: "arrow.down.left.and.arrow.up.right", title: "Size", content: "Varies from small puffs to large, towering formations.")
            
            Divider()
                .frame(width: 300)
            
            CloudIdentificationViewRow(SFSymbol: "paintpalette", title: "Color", content: "Typically white, but can have darker bases if rain is imminent.")
            
            Divider()
                .frame(width: 300)
            
            CloudIdentificationViewRow(SFSymbol: "location", title: "Location", content: "Usually found at lower altitudes, often on fair weather days.")
                .padding(.bottom)
        }
        .background(ColoredGlassView(centerUnitPoint: .topLeading, radius: 2000))
//        .thinBorder()
        .clipShape(RoundedRectangle(cornerRadius: 25))
        .padding(.horizontal)
        .shadow(radius: 1)
    }
    
    private var historicalInformationTitle: some View {
        Text("Historical Information 🏛️")
            .font(.title)
            .bold()
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.leading, 25)
            .padding(.top)
    }
    
    private var similarCloudsTitle: some View {
        Text("Don't Confuse With 🚫")
            .font(.title)
            .bold()
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.leading, 25)
            .padding(.top)
    }
    
    private var similarCloudsSection: some View {
        
        ScrollView(.horizontal) {
            LazyHStack(spacing: 0) {
                ForEach(1...4, id: \.self) { count in
                    SimilarCloudCardView(image: "Mammatus1", name: "Mamma Clouds", description: "Mamma clouds and cumulus clouds are similar in shape and size but mamma clouds are identifyable by their large bulbs hanging from the bottom of their cloud.")
                        .frame(width: UIScreen.main.bounds.width - 50)
                        .padding(.horizontal, 5)
                        .scrollTransition { content, phase in
                            content
                                .opacity(phase.isIdentity ? 1 : 0.9)
                                .scaleEffect(y: phase.isIdentity ? 1 : 0.95)
                        }
                }
            }
            .scrollTargetLayout()
        }
        .scrollIndicators(.hidden)
        .scrollTargetBehavior(.viewAligned)
        .contentMargins(20, for: .scrollContent)
    }
    
    private var lookOutForTitle: some View {
        Text("Also Look For 👀")
            .font(.title)
            .bold()
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.leading, 25)
            .padding(.top)
    }
    
    private var lookOutForSection: some View {
        EmptyView()
    }
    
    private var associatedArticlesTitle: some View {
        Text("Mentioned In 📖")
            .font(.title)
            .bold()
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.leading, 25)
            .padding(.top)
    }
    
    private var associatedArticlesSection: some View {
        EmptyView()
    }
    
    private var formationAndDevelopmentTitle: some View {
        Text("Cloud Formation ☁️")
            .font(.title)
            .bold()
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.leading, 25)
            .padding(.top)
    }
    
    private var formationAndDevelopmentSection: some View {
        EmptyView()
    }
    
}



#Preview {
    CloudInfoCardView(cloud: CloudModel.Cumulus)
}

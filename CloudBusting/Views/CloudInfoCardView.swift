//
//  CloudInfoCardView.swift
//  CloudBusting
//
//  Created by Ben Cuello-Wolffe on 7/3/24.
//

import SwiftUI
import WrappingHStack

struct CloudInfoCardView: View {
    
    let cloud: CloudModel
    
    var body: some View {
        NavigationStack {
            ZStack() {
                
                Color.testLight.ignoresSafeArea()
                
                ScrollView {
                    
                    StretchyHeaderView(image: Image("Cindy-Otter"), initialHeaderHeight: 350)
                    
                    CloudInfoView(cloud: cloud, isScanned: false)
                        .clipShape(
                            .rect(topLeadingRadius: 25, topTrailingRadius: 25)
                        )
//                        .padding(.bottom, 25)
                        .padding(.top, -35)
                }
            }
        }
    }
}

struct ScannedCloudInfoCardView: View {
    
    let scanAttempt: ScanAttemptModel
    
    var body: some View {
        NavigationStack {
            ZStack() {
                
                Color.testLight.ignoresSafeArea()
                
                ScrollView {
                    
                    StretchyHeaderView(image: Image(scanAttempt.imageName), initialHeaderHeight: 350)
                    
                    CloudInfoView(cloud: scanAttempt.cloudIdentified, isScanned: true)
                        .clipShape(
                            .rect(topLeadingRadius: 25, topTrailingRadius: 25)
                        )
                        .padding(.bottom, 25)
                        .padding(.top, -35)
                }
                .padding(.bottom, 25)
            }
        }
    }
}

struct CloudInfoView: View {
    
    let cloud: CloudModel
    let isScanned: Bool
    
    var body: some View {
            
        ZStack {
            Color.testLight.ignoresSafeArea()
            
            LinearGradient(stops: [
                .init(color: .testDark, location: 0),
                .init(color: .clear, location: 0.1)
            ], startPoint: .top, endPoint: .bottom)
            .ignoresSafeArea()
            
            LazyVStack {
                
                overviewTitle
                
                RoundedRectangle(cornerRadius: 25)
                    .frame(width: 350, height: 2)
                    .foregroundStyle(Color(UIColor.darkGray))
                    .font(.title2)
                    .padding(.bottom)
                
                ExpandableTextView(text: cloud.aboutInfo)
                    .padding(.horizontal)
                
                
                NavigationLink {
                    EmptyView()
                } label: {
                    imagesTitle
                }
                
                imagesSection
                
                keyInformationTitle
                
                keyInformationSection
                
                identificationTitle
                
                identificationSection
                
                NavigationLink {
                    EmptyView()
                } label: {
                    similarCloudsTitle
                }

                
                similarCloudsSection
                
                NavigationLink {
                    EmptyView()
                } label: {
                    lookOutForTitle
                }
                
                lookOutForSection
                    
                
//                formationAndDevelopmentTitle
//                
//                historicalInformationTitle
//                
//                associatedArticlesTitle
//                
//                asSeenInArtworkTitle
                
            }
            .padding(.bottom, 50)
        }
//        .toolbar(.hidden, for: .tabBar)
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
                .foregroundStyle(.nonInteractiveText)
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
            
        VStack {
            Image(image)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(height: 200)
                .clipped()
            
            HStack {
                Image(systemName: "exclamationmark.triangle.fill")
//                    .symbolRenderingMode(.hierarchical)
                
                Text(name)

                Spacer()
            }
            .font(.title2)
            .bold()
            .foregroundStyle(.testAccent)
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.leading, 25)
            .padding(.top)
            
            Text(description)
                .paragraphText()
                .padding(.horizontal, 25)
                .padding(.vertical, 10)
            
        }
        .multilineTextAlignment(.leading)
        .padding(.bottom)
        .background(Color.fill)
        .clipShape(RoundedRectangle(cornerRadius: 25))
        .shadow(radius: 10)
        
    }
}

struct lookOutForCloudCardView: View {
    
    let image: String
    let name: String
    
    var body: some View {
        
        ZStack {
            Image(image)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(height: 200)
                .clipped()
                .glur(offset: 0.45, interpolation: 0.6)
            
            VStack {
                Spacer()

                Text(name)
                    .font(.title2)
                    .bold()
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.leading, 25)
                    .padding(.top)
                    .foregroundStyle(.nonInteractiveText)
                    .padding(.bottom)
            }
            
            
        }
        .clipShape(RoundedRectangle(cornerRadius: 25))
        .shadow(radius: 10)
        
    }
}

extension CloudInfoView {
    
    private var overviewTitle: some View {
        
        VStack {
            
            HStack(alignment: .top) {
                Text(cloud.name)
                    .font(.largeTitle)
                    .bold()
                
                Spacer()
                
                Image(systemName: isScanned ? "plus.circle.fill" : "heart.circle.fill")
                    .font(.title)
                    .symbolRenderingMode(.hierarchical)
                    .foregroundStyle(.testAccent)
                    .bold()
                    .padding(.top, 5)
                
                Image(systemName: "square.and.arrow.up.circle.fill")
                    .font(.title)
                    .symbolRenderingMode(.hierarchical)
                    .foregroundStyle(.testAccent)
                    .bold()
                    .padding(.top, 5)
                
            }
            .padding(.top, 40)
            
            Text("Cu")
                .font(.title2)
                .foregroundStyle(.testText)
                .bold()
                .frame(maxWidth: .infinity, alignment: .leading)
                .opacity(0.5)
            
            WrappingHStack(alignment: .leading, horizontalSpacing: 10, verticalSpacing: 10) {

                TagView(fontStyle: .headline, title: "Common", color: .teal)
                
                
                TagView(fontStyle: .headline, title: "Unlikely", color: .blue, icon: "umbrella.fill", iconStyle: .subheadline)
            }
            .padding(.vertical, 5)
            .padding(.bottom, 10)
            .foregroundStyle(.testText)
            
        }
        .padding(.horizontal, 25)
    }
    
    private var imagesTitle: some View {
        HStack {
            Text("Images")
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
        Text("Key Information")
            .font(.title)
            .bold()
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.leading, 25)
            .padding(.top)
    }
    
    private var keyInformationSection: some View {
        
        VStack(spacing: 10) {
            Text("The Cumulus cloud stays at low altitudes with potential to go higher, has a low precipitation chance, and has a low to medium Liquid Water Content (LWC).")
                .paragraphText()
                .padding()
                .background(Color.fill)
                .clipShape(RoundedRectangle(cornerRadius: 25))
            
            HStack(spacing: 10) {
                // Left column
                InfoCard(title: "Altitude", icon: "ruler", shouldRotateIcon: true, alignment: .leading) {
                    AltitudeChartView(cloud: cloud)
                    Text("300 - 1900m")
                        .infoHeadline()
                    Text("Low")
                        .infoSubheadline()
                }
                .frame(width: UIScreen.main.bounds.width * 0.45)
                
                // Right column
                VStack(spacing: 10) {
                    
                    InfoCard(title: "Precipitation", icon: "umbrella.fill", shouldRotateIcon: false, alignment: .center) {
                        
                        Spacer()
                            
                        Gauge(value: 10, in: 0...100) {
                        } currentValueLabel: {
                            Image(systemName: "cloud.sun.fill")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 25)
                                .foregroundStyle(.testText)
                        }
                        .tint(.testText)
                        .opacity(0.7)
                        .gaugeStyle(.accessoryCircular)
                        .scaleEffect(1.5)
                        
                        Text("Unlikely")
                            .infoHeadline()
                            .padding(.bottom, 5)
                        
                    }
                    .frame(maxWidth: .infinity)
                    .aspectRatio(1.0, contentMode: .fit)

//                    .frame(width: UIScreen.main.bounds.width * 0.45)
//                    .frame(maxHeight: .infinity)
                    
                    
                    InfoCard(title: "Water Content", icon: "drop.fill", shouldRotateIcon: false, alignment: .leading) {
                        Text("0.3 g/m³")
                            .font(.largeTitle)
                            .fontWeight(.medium)
                            .foregroundStyle(.testText)
                            .padding(.top, 1)
                        
                        Spacer()
                        
                        Text("Liquid")
                            .infoHeadline()
                        Text("Low - Medium")
                            .infoSubheadline()
                    }
                    .frame(maxWidth: .infinity)
                    .aspectRatio(1.0, contentMode: .fit)
                }
//                .aspectRatio(0.4, contentMode: .fit)
//                .frame(maxWidth: .infinity)
            }
        }
        .padding()
    }
    
    private var identificationTitle: some View {
        Text("Identification")
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
        .background(ColoredGlassView(centerUnitPoint: .top, radius: 2000))
        .clipShape(RoundedRectangle(cornerRadius: 25))
        .padding(.horizontal)
        .padding(.bottom)
        .shadow(radius: 1)
    }
    
    private var historicalInformationTitle: some View {
        Text("Historical Information")
            .font(.title)
            .bold()
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.leading, 25)
            .padding(.top)
    }
    
    private var similarCloudsTitle: some View {
        HStack {
            Text("Don't Confuse With")
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
        .padding(.top)
        .padding(.bottom, -5)
    }
    
    private var similarCloudsSection: some View {
        
        ScrollView(.horizontal) {
            LazyHStack(spacing: 0) {
                ForEach(1...4, id: \.self) { count in
                    NavigationLink {
                        EmptyView()
                    } label: {
                        SimilarCloudCardView(image: "Mammatus1", name: "Mamma Clouds", description: "Similar in shape and size but but have large bulbs hanging from the bottom.")
                            .frame(width: UIScreen.main.bounds.width - 50)
                            .padding(.horizontal, 5)
                            .scrollTransition { content, phase in
                                content
                                    .opacity(phase.isIdentity ? 1 : 0.75)
                                    .scaleEffect(y: phase.isIdentity ? 1 : 0.95)
                            }
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
        HStack {
            Text("Also Look For")
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
        .padding(.top)
        .padding(.bottom, -5)
    }
    
    private var lookOutForSection: some View {
        ScrollView(.horizontal) {
            LazyHStack(spacing: 0) {
                ForEach(1...2, id: \.self) { count in
                    NavigationLink {
                        EmptyView()
                    } label: {
                        lookOutForCloudCardView(image: "Mammatus2", name: "Mamma Clouds")
                            .frame(width: UIScreen.main.bounds.width - 50)
                            .padding(.horizontal, 5)
                            .scrollTransition { content, phase in
                                content
                                    .opacity(phase.isIdentity ? 1 : 0.9)
                                    .scaleEffect(y: phase.isIdentity ? 1 : 0.95)
                            }
                    }
                }
            }
            .scrollTargetLayout()
        }
        .scrollIndicators(.hidden)
        .scrollTargetBehavior(.viewAligned)
        .contentMargins(20, for: .scrollContent)
    }
    
    private var associatedArticlesTitle: some View {
        Text("Mentioned In")
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
        Text("Cloud Formation")
            .font(.title)
            .bold()
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.leading, 25)
            .padding(.top)
    }
    
    private var asSeenInArtworkTitle: some View {
        Text("As Seen In Artwork")
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

struct InfoCard<Content: View>: View {
    let title: String
    let icon: String
    let shouldRotateIcon: Bool
    let alignment: HorizontalAlignment
    @ViewBuilder let content: () -> Content
    
    var body: some View {
        VStack(alignment: alignment) {
            HStack {
                
                Image(systemName: icon)
                    .if(shouldRotateIcon) { view in
                        view.rotationEffect(.degrees(-90))
                    }
                Text(title)
                    .font(.headline)
                    .bold()
                    .if(shouldRotateIcon) { view in
                        view.padding(.leading, -5)
                    }

                if (alignment != .leading) {
                    Spacer()
                }
                
            }
            .foregroundStyle(.black)
            .opacity(0.5)
            
            content()
        }
        .padding()
        .background(Color.fill)
        .clipShape(RoundedRectangle(cornerRadius: 25))
    }
}



#Preview {
    CloudInfoCardView(cloud: CloudModel.Cumulus)
}

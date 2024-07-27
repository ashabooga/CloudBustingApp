//
//  ColoredGlassView.swift
//  CloudBusting
//
//  Created by Ben Cuello-Wolffe on 7/9/24.
//

import SwiftUI

struct ColoredGlassView: View {
    
    let centerUnitPoint: UnitPoint
    let radius: CGFloat
    
    var body: some View {
        ZStack {
            RadialGradient(colors: [Color.darkColor1, Color.lightColor1, Color.white], center: centerUnitPoint, startRadius: 0, endRadius: radius)
                .ignoresSafeArea()
                .blur(radius: 20, opaque: true)
//                .overlay(.ultraThinMaterial)
            
        }
    }
}

struct BlurredGradientBackgroundView: View {
    var body: some View {
        ZStack {
            Color(UIColor.systemBackground).ignoresSafeArea()
            
            LinearGradient(stops: [
                .init(color: .darkColor1, location: 0.1),
                .init(color: .clear, location: 0.4)
            ], startPoint: .top, endPoint: .bottom)
            .ignoresSafeArea()
        }
        .blur(radius: 5)
        .ignoresSafeArea()
    }
}

#Preview {
    ColoredGlassView(centerUnitPoint: .topLeading, radius: 800)
}

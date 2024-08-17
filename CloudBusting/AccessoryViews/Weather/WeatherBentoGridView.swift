//
//  WeatherBentoGridView.swift
//  CloudBusting
//
//  Created by Ben Cuello-Wolffe on 7/6/24.
//

import SwiftUI

struct WeatherBentoGridView: View {
    var body: some View {
        
        VStack {
            
            Text("The weather is overcast, with cloud cover at high and medium altitudes and rain starting at 6PM.")
                .font(.headline)
                .multilineTextAlignment(.leading)
                .padding()
                .background {
                    RoundedRectangle(cornerRadius: 15)
                        .foregroundStyle(.ultraThinMaterial)
                }
                .padding(.horizontal)
            
            HStack {
                VStack {
                    RoundedRectangle(cornerRadius: 25)
                        .foregroundStyle(.ultraThinMaterial)
                        .overlay {
                            WeatherBentoGridItemView(title: "Precipitation", sfSymbol: "umbrella.fill")
                                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
                                .padding()
                        }
                }
                .padding(.trailing, 5)
                
                VStack {
                    RoundedRectangle(cornerRadius: 25)
                        .foregroundStyle(.thinMaterial)
                }
                .padding(.leading, 5)
            }
            .padding()
            .frame(height: 200)
        }
        
    }
}

struct WeatherBentoGridItemView: View {
    
    var title: String
    var sfSymbol: String
    
    
    var body: some View {
        VStack {
            
            HStack {
                Image(systemName: sfSymbol)
                
                Text(title)
                    .font(.headline)
                    .bold()
            }
            .foregroundStyle(.black)
            .opacity(0.5)
        }
    }
}

#Preview {
    WeatherBentoGridView()
}

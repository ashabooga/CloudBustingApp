//
//  WeatherContentViews.swift
//  CloudBusting
//
//  Created by Ben Cuello-Wolffe on 8/10/24.
//

import SwiftUI
import Charts

struct AltitudeChartView: View {
    
    let cloud: CloudModel
    
    var body: some View {
        Chart {
            BarMark(
                x: .value("Altitude", ""),
                yStart: .value("Minimum Altitude", 300),
                yEnd: .value("Maximum Altitude", 1500),
                width: 75
            )
            .foregroundStyle(.testText)
            .clipShape(RoundedRectangle(cornerRadius: 25))
            .offset(x: -15)
        }
        .chartYScale(domain: 0...20000)
        .chartYAxis(content: {
            AxisMarks(preset: .inset, values: [0, 1800, 6300, 20000])
        })
        .chartXAxis(.hidden)
        .padding()
//        .clipShape(RoundedRectangle(cornerRadius: 5))
//        .thinBorder()
//        .shadow(radius: 2)
        
    }
}

#Preview {
    AltitudeChartView(cloud: CloudModel.Cumulus)
}

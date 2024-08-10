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
                yEnd: .value("Maximum Altitude", 1500)
            )
            .foregroundStyle(.testText)
            .clipShape(RoundedRectangle(cornerRadius: 25))
        }
        .chartYScale(domain: 0...20000)
        .chartYAxisLabel("Altitude (meters)", position: .leading)
        .chartYAxis(content: {
            AxisMarks(preset: .inset, values: [0, 1800, 6300, 20000])
        })
        .padding()
    }
}

#Preview {
    AltitudeChartView(cloud: CloudModel.Cumulus)
}

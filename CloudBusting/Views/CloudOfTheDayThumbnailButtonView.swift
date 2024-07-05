//
//  CloudOfTheDayView.swift
//  CloudBusting
//
//  Created by Ben Cuello-Wolffe on 6/30/24.
//

import SwiftUI

struct CloudOfTheDayThumbnailButtonView: View {
    
    let cloud: CloudModel
    
    var body: some View {
        CloudOfTheDayThumbnailView(cloud: cloud)
            .shadow(radius: 10)
    }
}

struct CloudOfTheDayThumbnailView: View {
    
    let cloud: CloudModel
    
    var body: some View {
        ZStack {
            Image(cloud.cloudOfTheDayImage)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 350, height: 200)
                .offset(y: 20)
                .clipped()
            
            VStack {
                Spacer()
                Text(cloud.name)
                    .font(.largeTitle)
                    .bold()
                    .foregroundStyle(.white)
                    .padding(.vertical)
            }
        }
        .frame(width: 350, height: 200)
        .cornerRadius(10)
    }
}

#Preview {
    CloudOfTheDayThumbnailButtonView(cloud: CloudModel.Cumulus)
}

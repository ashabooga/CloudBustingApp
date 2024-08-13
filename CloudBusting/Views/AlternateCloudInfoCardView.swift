//
//  AlternateCloudInfoCardView.swift
//  CloudBusting
//
//  Created by Ben Cuello-Wolffe on 7/19/24.
//

import SwiftUI

struct AlternateCloudInfoCardView: View {
    let cloud: CloudModel
    
    var body: some View {
        ZStack(alignment: .top) {
            
            Image("Cindy-Otter")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(height: 300)
                .ignoresSafeArea()
            
            
            ScrollView {
                
                Rectangle()
                    .fill(Color.clear)
                    .frame(height: 200)
                
                CloudInfoView(cloud: cloud, isScanned: <#Bool#>)
                    .clipShape(
                        .rect(topLeadingRadius: 25, topTrailingRadius: 25)
                    )
            }
            .ignoresSafeArea(edges: .bottom)
            .frame(maxHeight: .infinity)
        }
    }
}

struct AlternateCloudInfoView: View {
    
    let cloud: CloudModel
    
    var body: some View {
        /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Hello, world!@*/Text("Hello, world!")/*@END_MENU_TOKEN@*/
    }
}

#Preview {
    AlternateCloudInfoCardView(cloud: CloudModel.Cumulus)
}

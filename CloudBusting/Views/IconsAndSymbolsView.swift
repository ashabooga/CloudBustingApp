//
//  IconsAndSymbolsView.swift
//  CloudBusting
//
//  Created by Ben Cuello-Wolffe on 7/23/24.
//

import SwiftUI

struct SymbolButtonView: View {
    
    let systemName: String
    
    var body: some View {
        Image(systemName: systemName)
            .font(.system(size: 15))
            .fontWeight(.heavy)
            .padding(8)
            .background(Circle().fill(.thickMaterial))
    }
}

struct TagView: View {
    
    var fontStyle: Font
    var title: String
    var color: Color
    var icon: String?
    var iconStyle: Font?
    
    var body: some View {
        
        HStack {
            
            if (icon != nil && iconStyle != nil) {
                Image(systemName: icon!)
                    .font(iconStyle!)
            }
            
            Text(title)
                .bold()
                .font(fontStyle)
        }
        .padding(5)
        .padding(.horizontal, 5)
        .background(RoundedRectangle(cornerRadius: 15).foregroundStyle(color))
    }
}

#Preview {
    SymbolButtonView(systemName: "square.and.arrow.up")
}

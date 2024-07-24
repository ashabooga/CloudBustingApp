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

#Preview {
    SymbolButtonView(systemName: "square.and.arrow.up")
}

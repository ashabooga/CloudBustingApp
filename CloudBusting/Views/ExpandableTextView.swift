//
//  ExpandableTextView.swift
//  CloudBusting
//
//  Created by Ben Cuello-Wolffe on 7/5/24.
//

import SwiftUI
import Glur


struct ExpandableTextView: View {
    
    var text: String
    @State private var showFullText: Bool = false
    
    var body: some View {
        
        ZStack {
            
            VStack(alignment: .leading) {
                Text(text)
                    .lineLimit(showFullText ? nil : 4)
                    .font(.callout)
                    .foregroundColor(Color.gray)
                    .padding()
                    .animation(showFullText ? Animation.easeInOut : .none, value: showFullText)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
        }
        .background {
//            RoundedRectangle(cornerRadius: 25)
//                .foregroundStyle(.darkColor1)
            ColoredGlassView(centerUnitPoint: .topLeading, radius: 2000)
                .clipShape(RoundedRectangle(cornerRadius: 25))
                .padding(.bottom, showFullText ? -20 : 0)
        }
        .if(!showFullText) { view in
            view.glur(offset: 0.5, interpolation: 0.3)
        }
        .overlay {
            Button(action: {
                withAnimation(.easeInOut) {
                    showFullText.toggle()
                }
            }, label: {
                Text(showFullText ? "Less" : "Read more..")
                    .font(.callout)
                    .fontWeight(.bold)
                    .padding(.vertical, 4)
            })
            .accentColor(.blue)
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottomLeading)
            .padding(.horizontal)
            .padding(.vertical, showFullText ? -12 : 10)
        }
        .padding(.bottom, showFullText ? 30 : 10)
        
    }
    
    
}

#Preview {
    ExpandableTextView(text: CloudModel.Cumulus.aboutInfo)
}

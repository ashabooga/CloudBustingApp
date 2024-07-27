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
                    .foregroundStyle(.nonInteractiveText)
                    .fontWeight(.semibold)
                    .padding()
                    .animation(showFullText ? Animation.easeInOut : .none, value: showFullText)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.bottom, showFullText ? 20 : 0)
        }
        .background {
//            RoundedRectangle(cornerRadius: 25)
//                .foregroundStyle(.darkColor1)
//            ColoredGlassView(centerUnitPoint: .topLeading, radius: 4000)
            Color(UIColor.systemBackground)
        }
        .if(!showFullText) { view in
            view.glur(offset: 0.45, interpolation: 0.6)
        }
        .clipShape(RoundedRectangle(cornerRadius: 25))
        .overlay {
            Button(action: {
                withAnimation(.easeInOut) {
                    showFullText.toggle()
                }
            }, label: {
                Text(showFullText ? "Less" : "Read more..")
                    .font(.callout)
                    .foregroundStyle(.interactiveText)
                    .fontWeight(.bold)
                    .padding(.vertical, 4)
            })
            .accentColor(.blue)
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottomLeading)
            .padding(.horizontal)
            .padding(.vertical, showFullText ? 9 : 10)
        }
        .padding(.bottom, 20)
        
    }
    
    
}

#Preview {
    ExpandableTextView(text: CloudModel.Cumulus.aboutInfo)
}

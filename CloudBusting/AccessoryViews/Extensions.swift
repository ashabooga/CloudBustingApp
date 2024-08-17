import SwiftUI

extension View {
    @ViewBuilder
    func `if`<Content: View>(_ conditional: Bool, content: (Self) -> Content) -> some View {
        if conditional {
            content(self)
        } else {
            self
        }
    }
    
    func thinBorder() -> some View {
        self.overlay(RoundedRectangle(cornerRadius: 25).stroke(.gray, lineWidth: 0.5))
    }
    

    func infoHeadline() -> some View {
        self.foregroundStyle(.testText)
            .font(.headline)
            .fontWeight(.bold)
            .frame(alignment: .leading)
    }
    
    func infoSubheadline() -> some View {
        self.foregroundStyle(.testText)
            .font(.subheadline)
            .fontWeight(.semibold)
            .frame(alignment: .leading)
    }
}

extension Text {
    
    func paragraphText() -> some View {
        self.font(.callout)
            .foregroundStyle(.testText)
            .fontWeight(.semibold)
            .frame(maxWidth: .infinity, alignment: .leading)
            .fixedSize(horizontal: false, vertical: true)
    }
    
}

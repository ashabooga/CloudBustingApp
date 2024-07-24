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
}

extension Text {
    
    func paragraphText() -> some View {
        self.font(.callout)
            .foregroundStyle(.nonInteractiveText)
            .fontWeight(.semibold)
            .frame(maxWidth: .infinity, alignment: .leading)
            .fixedSize(horizontal: false, vertical: true)
    }
    
}

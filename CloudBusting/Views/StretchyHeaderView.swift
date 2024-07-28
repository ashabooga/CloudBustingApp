import SwiftUI

let screenW: CGFloat = UIScreen.main.bounds.width

struct StretchyHeaderView: View {
    var image: Image
    var initialHeaderHeight: CGFloat
    
    var body: some View {
        GeometryReader(content: { geometry in
            
            let minY: CGFloat = geometry.frame(in: .global).minY

            image
                .resizable()
                .aspectRatio(contentMode: .fill)
                .offset(y: minY > 0 ? -minY : 0)
                .frame(width: screenW ,height: minY > 0 ? initialHeaderHeight + minY : initialHeaderHeight)
                
        })
        .frame(height: initialHeaderHeight)
    }
}

#Preview {
    StretchyHeaderView(image: Image("Cindy-Otter"), initialHeaderHeight: 350)
}

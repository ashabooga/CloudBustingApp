import Foundation
import SwiftUI

struct StretchingHeaderView: View {
    @State private var offset: CGFloat = 0
    var image: String

    var body: some View {
        ZStack(alignment: .top) {
            Image(image)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(height: 300 + max(0, -offset))
                .clipped()
                .ignoresSafeArea()
                .transformEffect(.init(translationX: 0, y: -(max(0, offset))))

            if #available(iOS 18.0, *) {
                ScrollView {
                    Rectangle()
                        .fill(Color.clear)
                        .frame(height: 300)
                    
                    CloudInfoView(cloud: CloudModel.Cumulus)
                }
                .onScrollGeometryChange(for: CGFloat.self, of: { geo in
                    return geo.contentOffset.y + geo.contentInsets.top
                }, action: { new, old in
                    offset = new
                })
            } else {
                // Fallback on earlier versions
            }
        }
    }
}

#Preview {
    StretchingHeaderView(image: "Cindy-Otter")
}

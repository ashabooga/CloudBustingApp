//import SwiftUI
//
//struct ArticleThumbnailButtonView: View {
//    var article: ArticleModel
//    
//    var body: some View {
//        
//        NavigationStack {
//            NavigationLink(destination: ArticleView(article: article)) {
//                ArticleThumbnail(article: article)
//            }
//            .buttonStyle(PlainButtonStyle())
//        }
//    }
//}
//
//struct ArticleThumbnail: View {
//    var article: ArticleModel
//    
//    var body: some View {
//        ZStack {
//            article.image
//                .resizable()
//                .aspectRatio(contentMode: .fill)
//                .frame(width: 200, height: 200)
//                .clipped()
//            
//            VStack {
//                Spacer()
//                Text(article.title)
//                    .font(.headline)
//                    .frame(width: 200)
//                    .frame(maxWidth: .infinity)
//                    .padding(.vertical)
//                    .padding(.horizontal, 2)
//                    .background(BlurView(style: .systemMaterial))
//                
//            }
//        }
//        .frame(width: 200, height: 200)
//        .cornerRadius(10)
//        .shadow(radius: 2)
//    }
//}
//
//struct ArticleView: View {
//    
//    let article: ArticleModel
//    
//    init(article: ArticleModel) {
//        self.article = article
//        UILabel.appearance(whenContainedInInstancesOf: [UINavigationBar.self]).adjustsFontSizeToFitWidth = true
//    }
//    
//    var body: some View {
//        NavigationStack {
//            ScrollView {
//                article.image
//                    .resizable()
//                    .aspectRatio(contentMode: .fill)
//                
//                Text(article.content)
//                    .padding()
//            }
//        }
//        .navigationTitle(article.title)
//        .navigationBarTitleDisplayMode(.large)
//    }
//}
//
//#Preview {
//    NavigationStack {
//        ArticleThumbnailButtonView(article: ArticleModel.noArticle)
//    }
//}

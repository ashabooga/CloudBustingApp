//
//  UserViewModel.swift
//  CloudBusting
//
//  Created by Ben Cuello-Wolffe on 7/31/24.
//

import Foundation

class UserViewModel: ObservableObject {
    
    @Published var user: UserModel
    
    init(user: UserModel = UserModel.exampleUser) {
        self.user = user
    }
    
    // MARK: - ScanAttempts Methods
    func addScanAttempt(_ attempt: ScanAttemptModel) {
        user.addScanAttempt(attempt)
    }
        
    func removeScanAttempt(withID id: UUID) {
        user.removeScanAttempt(withID: id)
    }
    
    // MARK: - Collection Methods
    func addToCollection(_ item: ScanAttemptModel) {
        user.addToCollection(item)
    }
    
    func removeFromCollection(withID id: UUID) {
        user.removeFromCollection(withID: id)
    }
    
    // MARK: - CloudLists Methods
    func addCloudList(_ list: CloudListModel) {
        user.addCloudList(list)
    }
    
    func removeCloudList(withID id: UUID) {
        user.removeCloudList(withID: id)
    }
    
    // MARK: - SavedArticles Methods
    func addSavedArticle(_ article: ArticleModel) {
        user.addSavedArticle(article)
    }
    
    func removeSavedArticle(withID id: UUID) {
        user.removeSavedArticle(withID: id)
    }
    
}

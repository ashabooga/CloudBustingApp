//
//  UserModel.swift
//  CloudBusting
//
//  Created by Ben Cuello-Wolffe on 7/29/24.
//

import Foundation

struct UserModel {
    
    var scanAttempts: [ScanAttemptModel]
    var collection: [ScanAttemptModel]
    var cloudLists: [CloudListModel]
    var savedArticles: [ArticleModel]
    
    init(scanAttempts: [ScanAttemptModel], collection: [ScanAttemptModel], cloudLists: [CloudListModel], savedArticles: [ArticleModel]) {
        self.scanAttempts = scanAttempts
        self.collection = collection
        self.cloudLists = cloudLists
        self.savedArticles = savedArticles
    }
    
    // Methods for scanAttempts
    mutating func addScanAttempt(_ attempt: ScanAttemptModel) {
        scanAttempts.append(attempt)
    }
    
    mutating func removeScanAttempt(withID id: UUID) {
        scanAttempts.removeAll { $0.id == id }
    }
    
    // Methods for collection
    mutating func addToCollection(_ item: ScanAttemptModel) {
        collection.append(item)
    }
    
    mutating func removeFromCollection(withID id: UUID) {
        collection.removeAll { $0.id == id }
    }
    
    // Methods for cloudLists
    mutating func addCloudList(_ list: CloudListModel) {
        cloudLists.append(list)
    }
    
    mutating func removeCloudList(withID id: UUID) {
        cloudLists.removeAll { $0.id == id }
    }
    
    // Methods for savedArticles
    mutating func addSavedArticle(_ article: ArticleModel) {
        savedArticles.append(article)
    }
    
    mutating func removeSavedArticle(withID id: UUID) {
        savedArticles.removeAll { $0.id == id }
    }
    
    
    static let exampleUser: UserModel = UserModel(scanAttempts: [ScanAttemptModel(id: UUID(), imageName: "Cindy-Otter", dateTime: Date(), cloudIdentified: CloudModel.Cumulus, displayImage: "Cindy-Otter"), ScanAttemptModel(id: UUID(), imageName: "Cumulus7", dateTime: Date(), cloudIdentified: CloudModel.Cumulus, displayImage: "Cumulus7"), ScanAttemptModel(id: UUID(), imageName: "Cumulus5", dateTime: Date(), cloudIdentified: CloudModel.Cumulus, displayImage: "Cumulus5")], collection: [ScanAttemptModel(id: UUID(), imageName: "Cindy-Otter", dateTime: Date(), cloudIdentified: CloudModel.Cumulus, displayImage: "Cindy-Otter"), ScanAttemptModel(id: UUID(), imageName: "Cumulus7", dateTime: Date(), cloudIdentified: CloudModel.Cumulus, displayImage: "Cumulus7"), ScanAttemptModel(id: UUID(), imageName: "Mammatus1", dateTime: Date(), cloudIdentified: CloudModel.Mamma, displayImage: "Mammatus1")], cloudLists: [CloudListModel.ExampleCloudList1, CloudListModel.ExampleCloudList2, CloudListModel.ExampleCloudList3, CloudListModel.ExampleCloudList4, CloudListModel.ExampleCloudList5], savedArticles: [ArticleModel.noArticle, ArticleModel.noArticle])
}

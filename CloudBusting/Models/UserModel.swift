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
    var wishlists: [CloudModel]
    var savedArticles: [ArticleModel]
    
    init(scanAttempts: [ScanAttemptModel], collection: [ScanAttemptModel], wishlists: [CloudModel], savedArticles: [ArticleModel]) {
        self.scanAttempts = scanAttempts
        self.collection = collection
        self.wishlists = wishlists
        self.savedArticles = savedArticles
    }
    
    static let exampleUser: UserModel = UserModel(scanAttempts: [ScanAttemptModel(id: UUID(), imageName: "Cindy-Otter", dateTime: Date(), cloudIdentified: CloudModel.Cumulus), ScanAttemptModel(id: UUID(), imageName: "Cumulus7", dateTime: Date(), cloudIdentified: CloudModel.Cumulus), ScanAttemptModel(id: UUID(), imageName: "Cumulus5", dateTime: Date(), cloudIdentified: CloudModel.Cumulus)], collection: [ScanAttemptModel(id: UUID(), imageName: "Cindy-Otter", dateTime: Date(), cloudIdentified: CloudModel.Cumulus), ScanAttemptModel(id: UUID(), imageName: "Cumulus7", dateTime: Date(), cloudIdentified: CloudModel.Cumulus), ScanAttemptModel(id: UUID(), imageName: "Mammatus1", dateTime: Date(), cloudIdentified: CloudModel.Mamma)], wishlists: [CloudModel.Cumulus, CloudModel.Cumulus, CloudModel.Cumulus, CloudModel.Cumulus, CloudModel.Cumulus, CloudModel.Cumulus], savedArticles: [ArticleModel.noArticle, ArticleModel.noArticle])
}

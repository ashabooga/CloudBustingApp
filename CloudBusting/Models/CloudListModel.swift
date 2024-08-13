import Foundation

struct CloudListModel: Identifiable {
     
    var id: UUID
    var title: String
    var clouds: [Cloud]
    var creationDate: Date
    var lastEdited: Date
    
    init(id: UUID, title: String, clouds: [Cloud], creationDate: Date, lastEdited: Date) {
        self.id = id
        self.title = title
        self.clouds = clouds
        self.creationDate = creationDate
        self.lastEdited = lastEdited
    }
    
    
    static let ExampleCloudList: CloudListModel = CloudListModel(id: UUID(), title: "My list!", clouds: [CloudModel.Cumulus, CloudModel.Cumulus, ScanAttemptModel(id: UUID(), imageName: "Cindy-Otter", dateTime: Date(), cloudIdentified: CloudModel.Cumulus), ScanAttemptModel(id: UUID(), imageName: "Cumulus7", dateTime: Date(), cloudIdentified: CloudModel.Cumulus), ScanAttemptModel(id: UUID(), imageName: "Cumulus5", dateTime: Date(), cloudIdentified: CloudModel.Cumulus), CloudModel.Mamma, CloudModel.Cumulus], creationDate: Date.now, lastEdited: Date.now)
    
}

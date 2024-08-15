import Foundation

enum CloudListItem {
    case cloud(CloudModel)
    case scanAttempt(ScanAttemptModel)
    
    var id: UUID {
        switch self {
        case .cloud(let model):
            return model.id
        case .scanAttempt(let model):
            return model.id
        }
    }

    var cloud: Cloud {
        switch self {
        case .cloud(let model):
            return model
        case .scanAttempt(let model):
            return model
        }
    }
}

struct CloudListModel: Identifiable {
     
    var id: UUID
    var title: String
    var clouds: [CloudListItem]
    var creationDate: Date
    var lastEdited: Date
    
    init(id: UUID, title: String, clouds: [CloudListItem], creationDate: Date, lastEdited: Date) {
        self.id = id
        self.title = title
        self.clouds = clouds
        self.creationDate = creationDate
        self.lastEdited = lastEdited
    }
    
    mutating func addCloud(_ cloud: CloudModel) {
        clouds.append(.cloud(cloud))
    }

    mutating func addScanAttempt(_ scanAttempt: ScanAttemptModel) {
        clouds.append(.scanAttempt(scanAttempt))
    }

    mutating func removeCloud(at index: Int) {
        clouds.remove(at: index)
    }
    
    
    static let ExampleCloudList1: CloudListModel = CloudListModel(
        id: UUID(),
        title: "My list!",
        clouds: [
            .scanAttempt(ScanAttemptModel(id: UUID(), imageName: "Cindy-Otter", dateTime: Date(), cloudIdentified: CloudModel.Cumulus, displayImage: "Cindy-Otter")),
            .scanAttempt(ScanAttemptModel(id: UUID(), imageName: "Cumulus7", dateTime: Date(), cloudIdentified: CloudModel.Cumulus, displayImage: "Cumulus7")),
            .scanAttempt(ScanAttemptModel(id: UUID(), imageName: "Cumulus5", dateTime: Date(), cloudIdentified: CloudModel.Cumulus, displayImage: "Cumulus7")),
            .cloud(CloudModel.Mamma),
            .cloud(CloudModel.Cumulus)
        ],
        creationDate: Date.now,
        lastEdited: Date.now
    )
    
    static let ExampleCloudList2: CloudListModel = CloudListModel(
        id: UUID(),
        title: "My list!",
        clouds: [
            .scanAttempt(ScanAttemptModel(id: UUID(), imageName: "Cumulus7", dateTime: Date(), cloudIdentified: CloudModel.Cumulus, displayImage: "Cumulus7")),
            .cloud(CloudModel.Cumulus),
            .cloud(CloudModel.Cumulus),
            .scanAttempt(ScanAttemptModel(id: UUID(), imageName: "Cindy-Otter", dateTime: Date(), cloudIdentified: CloudModel.Cumulus, displayImage: "Cindy-Otter")),
            .scanAttempt(ScanAttemptModel(id: UUID(), imageName: "Cumulus5", dateTime: Date(), cloudIdentified: CloudModel.Cumulus, displayImage: "Cumulus7")),
            .cloud(CloudModel.Mamma),
            .cloud(CloudModel.Cumulus)
        ],
        creationDate: Date.now,
        lastEdited: Date.now
    )
    
    static let ExampleCloudList3: CloudListModel = CloudListModel(
        id: UUID(),
        title: "My list!",
        clouds: [
            .scanAttempt(ScanAttemptModel(id: UUID(), imageName: "Cumulus5", dateTime: Date(), cloudIdentified: CloudModel.Cumulus, displayImage: "Cumulus7")),
            .cloud(CloudModel.Mamma),
            .cloud(CloudModel.Cumulus)
        ],
        creationDate: Date.now,
        lastEdited: Date.now
    )
    
    static let ExampleCloudList4: CloudListModel = CloudListModel(
        id: UUID(),
        title: "My list!",
        clouds: [
            .cloud(CloudModel.Mamma),
            .cloud(CloudModel.Cumulus),
            .cloud(CloudModel.Cumulus),
            .scanAttempt(ScanAttemptModel(id: UUID(), imageName: "Cindy-Otter", dateTime: Date(), cloudIdentified: CloudModel.Cumulus, displayImage: "Cindy-Otter")),
            .scanAttempt(ScanAttemptModel(id: UUID(), imageName: "Cumulus7", dateTime: Date(), cloudIdentified: CloudModel.Cumulus, displayImage: "Cumulus7")),
            .cloud(CloudModel.Cumulus)
        ],
        creationDate: Date.now,
        lastEdited: Date.now
    )
    
}

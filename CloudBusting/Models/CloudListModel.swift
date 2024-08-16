import Foundation

enum CloudListItem {
    case cloud(CloudModel, listID: UUID)
    case scanAttempt(ScanAttemptModel, listID: UUID)
    
    var id: UUID {
        switch self {
        case .cloud(let model, _):
            return model.id
        case .scanAttempt(let model, _):
            return model.id
        }
    }
    
    var listID: UUID {
        switch self {
        case .cloud(_, let listID):
            return listID
        case .scanAttempt(_, let listID):
            return listID
        }
    }
    
    var isScanned: Bool {
        switch self {
        case .cloud:
            return false
        case .scanAttempt:
            return true
        }
    }

    var cloud: Cloud {
        switch self {
        case .cloud(let model, _):
            return model
        case .scanAttempt(let model, _):
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
        clouds.append(.cloud(cloud, listID: UUID()))
    }

    mutating func addScanAttempt(_ scanAttempt: ScanAttemptModel) {
        clouds.append(.scanAttempt(scanAttempt, listID: UUID()))
    }

    mutating func removeCloud(withID id: UUID) {
        clouds.removeAll{ $0.listID == id }
    }
    
    
    static let ExampleCloudList1: CloudListModel = CloudListModel(
        id: UUID(),
        title: "My favorite clouds",
        clouds: [
            .scanAttempt(ScanAttemptModel(id: UUID(), imageName: "Cindy-Otter", dateTime: Date(), cloudIdentified: CloudModel.Cumulus, displayImage: "Cindy-Otter"), listID: UUID()),
            .scanAttempt(ScanAttemptModel(id: UUID(), imageName: "Cumulus7", dateTime: Date(), cloudIdentified: CloudModel.Cumulus, displayImage: "Cumulus7"), listID: UUID()),
            .scanAttempt(ScanAttemptModel(id: UUID(), imageName: "Cumulus5", dateTime: Date(), cloudIdentified: CloudModel.Cumulus, displayImage: "Cumulus7"), listID: UUID()),
            .cloud(CloudModel.Mamma, listID: UUID()),
            .cloud(CloudModel.Cumulus, listID: UUID())
        ],
        creationDate: Date.now,
        lastEdited: Date.now
    )
    
    static let ExampleCloudList2: CloudListModel = CloudListModel(
        id: UUID(),
        title: "I dedicate this list to Pudding <3",
        clouds: [
            .scanAttempt(ScanAttemptModel(id: UUID(), imageName: "Cumulus7", dateTime: Date(), cloudIdentified: CloudModel.Cumulus, displayImage: "Cumulus7"), listID: UUID()),
            .cloud(CloudModel.Cumulus, listID: UUID()),
            .cloud(CloudModel.Cumulus, listID: UUID()),
            .scanAttempt(ScanAttemptModel(id: UUID(), imageName: "Cindy-Otter", dateTime: Date(), cloudIdentified: CloudModel.Cumulus, displayImage: "Cindy-Otter"), listID: UUID()),
            .scanAttempt(ScanAttemptModel(id: UUID(), imageName: "Cumulus5", dateTime: Date(), cloudIdentified: CloudModel.Cumulus, displayImage: "Cumulus7"), listID: UUID()),
            .cloud(CloudModel.Mamma, listID: UUID()),
            .cloud(CloudModel.Cumulus, listID: UUID())
        ],
        creationDate: Date.now,
        lastEdited: Date.now
    )
    
    static let ExampleCloudList3: CloudListModel = CloudListModel(
        id: UUID(),
        title: "some that are okay",
        clouds: [
            .scanAttempt(ScanAttemptModel(id: UUID(), imageName: "Cumulus5", dateTime: Date(), cloudIdentified: CloudModel.Cumulus, displayImage: "Cumulus7"), listID: UUID()),
            .cloud(CloudModel.Mamma, listID: UUID()),
            .cloud(CloudModel.Cumulus, listID: UUID())
        ],
        creationDate: Date.now,
        lastEdited: Date.now
    )
    
    static let ExampleCloudList4: CloudListModel = CloudListModel(
        id: UUID(),
        title: "Da Best 😎",
        clouds: [
            .cloud(CloudModel.Mamma, listID: UUID()),
            .cloud(CloudModel.Cumulus, listID: UUID()),
            .cloud(CloudModel.Cumulus, listID: UUID()),
            .scanAttempt(ScanAttemptModel(id: UUID(), imageName: "Cindy-Otter", dateTime: Date(), cloudIdentified: CloudModel.Cumulus, displayImage: "Cindy-Otter"), listID: UUID()),
            .scanAttempt(ScanAttemptModel(id: UUID(), imageName: "Cumulus7", dateTime: Date(), cloudIdentified: CloudModel.Cumulus, displayImage: "Cumulus7"), listID: UUID()),
            .cloud(CloudModel.Cumulus, listID: UUID())
        ],
        creationDate: Date.now,
        lastEdited: Date.now
    )
    
    static let ExampleCloudList5: CloudListModel = CloudListModel(
        id: UUID(),
        title: "Empty List :(",
        clouds: [],
        creationDate: Date.now,
        lastEdited: Date.now
    )
    
}

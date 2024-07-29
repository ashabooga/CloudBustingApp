import Foundation

struct ScanAttemptModel {
    
    var id = UUID()
    var imageName: String
    var dateTime: Date
    var cloudIdentified: CloudModel
    
    init(id: UUID, imageName: String, dateTime: Date, cloudIdentified: CloudModel) {
        self.imageName = imageName
        self.dateTime = dateTime
        self.cloudIdentified = cloudIdentified
    }
}

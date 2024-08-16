//
//  CloudListViewModel.swift
//  CloudBusting
//
//  Created by Ben Cuello-Wolffe on 8/15/24.
//

import Foundation

class CloudListViewModel: ObservableObject {
    
    @Published var cloudList: CloudListModel
    
    init(cloudList: CloudListModel) {
        self.cloudList = cloudList
    }
 
    func addCloud(_ cloud: CloudModel) {
        cloudList.addCloud(cloud)
    }
    
    func addCloud(_ scanAttempt: ScanAttemptModel) {
        cloudList.addScanAttempt(scanAttempt)
    }
    
    func removeCloud(withID id: UUID) {
        cloudList.removeCloud(withID: id)
    }
    
    func wipeCloud(withID id: UUID) {
        cloudList.wipeCloud(withID: id)
    }
    
}

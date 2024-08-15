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
 
    func addCloud(cloud: Cloud) {
        
    }
    
}

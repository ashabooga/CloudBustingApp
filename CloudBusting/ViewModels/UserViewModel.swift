//
//  UserViewModel.swift
//  CloudBusting
//
//  Created by Ben Cuello-Wolffe on 7/31/24.
//

import Foundation

class UserViewModel: ObservableObject {
    
    @Published var user: UserModel
    
    init(user: UserModel) {
        self.user = user
    }
    
    
    
}

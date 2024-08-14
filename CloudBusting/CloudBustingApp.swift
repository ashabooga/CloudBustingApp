//
//  CloudBustingApp.swift
//  CloudBusting
//
//  Created by Ben Cuello-Wolffe on 6/29/24.
//

import SwiftUI

@main
struct CloudBustingApp: App {
    var body: some Scene {
        WindowGroup {
            MainView(userViewModel: UserViewModel(user: UserModel.exampleUser))
        }
    }
}

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
            UserLibraryView(user: UserModel.exampleUser)
//            CloudInfoCardView(cloud: CloudModel.Cumulus)
        }
    }
}

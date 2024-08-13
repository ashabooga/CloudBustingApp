//
//  MainView.swift
//  CloudBusting
//
//  Created by Ben Cuello-Wolffe on 8/13/24.
//

import SwiftUI


struct MainView: View {
    
//    @State private var selectedIndex: Int = 0
    
    var body: some View {
        TabView {
            
            HomeView()
                .tabItem {
                    Label("Home", systemImage: "house.fill")
                }
            
            CameraView()
                .tabItem {
                    Label("Camera", systemImage: "camera.viewfinder")
                }
            
            UserLibraryView(user: UserModel.exampleUser)
                .tabItem {
                    Label("Library", systemImage: "square.stack.fill")
                }
        }
        .tint(.highlight)
    }
}

#Preview {
    MainView()
}

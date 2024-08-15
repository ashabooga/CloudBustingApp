//
//  CloudListView.swift
//  CloudBusting
//
//  Created by Ben Cuello-Wolffe on 8/15/24.
//

import SwiftUI

struct CloudListView: View {
    
    @StateObject var cloudListViewModel: CloudListViewModel
    @State private var searchText = ""
    
    var body: some View {
        ZStack {
            
            Color.testDark.ignoresSafeArea()
            
            LinearGradient(stops: [
                .init(color: .testLight, location: 0),
                .init(color: .clear, location: 0.4)
            ], startPoint: .top, endPoint: .bottom)
            .ignoresSafeArea()
            
            
            VStack {
                
                
                List {
                    
                    Section {
                        titleView
                            .padding(.vertical)
                    
                    }
                    .listRowBackground(Color.clear)
                    .listSectionSeparator(.hidden)
                    
                    
                    ForEach(searchResults, id: \.id) { cloudListItem in
                        cloudListRowView(item: cloudListItem)
                    }
                    .listRowBackground(Color.clear)
                    .listSectionSeparator(.visible, edges: .top)
                    
                }
                .listStyle(.plain)
            }
        }
    }
    
    var searchResults: [CloudListItem] {
        if searchText.isEmpty {
            return cloudListViewModel.cloudList.clouds
        } else {
            return cloudListViewModel.cloudList.clouds.filter { $0.cloud.name.contains(searchText) }
        }
    }
}

struct cloudListRowView: View {
    
    var item: CloudListItem
    
    var body: some View {
        /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Hello, world!@*/Text("Hello, world!")/*@END_MENU_TOKEN@*/
    }
}

extension CloudListView {
    
    private var titleView: some View {
        
        
        HStack {
            
            Spacer()
            
            VStack {
                Rectangle()
                    .aspectRatio(1, contentMode: .fit)
                    .foregroundStyle(.clear)
                    .frame(width: 225)
                    .overlay {
                        Image(cloudListViewModel.cloudList.clouds[0].cloud.displayImage)
                            .resizable()
                            .scaledToFill()
                    }
                    .clipShape(RoundedRectangle(cornerRadius: 15))
                    
                Text(cloudListViewModel.cloudList.title)
                    .font(.title3)
                    .bold()
                    .padding(.top)
                
            }
            
            Spacer()
        }
    }
    
}

#Preview {
    CloudListView(cloudListViewModel: CloudListViewModel(cloudList: UserModel.exampleUser.cloudLists[0]))
}

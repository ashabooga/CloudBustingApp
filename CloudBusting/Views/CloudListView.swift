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
        NavigationStack {
            ZStack {
                
                Color.testDark.ignoresSafeArea()
                
                LinearGradient(stops: [
                    .init(color: .testLight, location: 0),
                    .init(color: .clear, location: 0.2)
                ], startPoint: .top, endPoint: .bottom)
                .ignoresSafeArea()
                
                
                VStack {
                    
                    
                    List {
                        
                        Section {
                            titleView
                                .padding(.vertical)
                                .shadow(radius: 10)
                        
                        }
                        .listRowBackground(Color.clear)
                        .listSectionSeparator(.hidden)
                        
                        
                        ForEach(searchResults, id: \.id) { cloudListItem in
                            
                            ZStack {
                                NavigationLink(destination: destinationView(for: cloudListItem)) {
                                    EmptyView()
                                }.opacity(0)
                                
                                CloudListRowView(item: cloudListItem)
                            }
                            
                            
                            
                            
                        }
                        .listRowBackground(Color.clear)
                        .listSectionSeparator(.visible, edges: .top)
                        
                    }
                    .listStyle(.plain)
                }
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

struct CloudListRowView: View {
    
    var item: CloudListItem
    
    var body: some View {
        
        HStack {
            Rectangle()
                .aspectRatio(1, contentMode: .fit)
                .foregroundStyle(.clear)
                .frame(width: 75)
                .overlay {
                    Image(item.cloud.displayImage)
                        .resizable()
                        .scaledToFill()
                }
                .clipShape(RoundedRectangle(cornerRadius: 5))
            
            VStack(alignment: .leading) {
                
                Text(item.cloud.name)
                    .font(.headline)
                
                Text(item.cloud.abbreviation)
                    .font(.subheadline)
                    .opacity(0.7)
                
            }
            .foregroundStyle(.testText)
            .padding(.leading, 5)
            
            Spacer()
            
            if (item.isScanned) {
                Image(systemName: "cloud.fill")
                    .font(.footnote)
                    .foregroundStyle(.highlight)
            }
            
            Button(action: {
                
            }, label: {
                Image(systemName: "ellipsis")
            })
        }
        
    }
}

@ViewBuilder
func destinationView(for item: CloudListItem) -> some View {
    switch item {
    case .cloud(let cloud):
        CloudInfoCardView(cloud: cloud)
    case .scanAttempt(let scanAttempt):
        ScannedCloudInfoCardView(scanAttempt: scanAttempt)
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

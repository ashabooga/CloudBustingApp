//
//  CloudListView.swift
//  CloudBusting
//
//  Created by Ben Cuello-Wolffe on 8/15/24.
//

import SwiftUI

struct CloudListView: View {
    
    @StateObject var cloudListViewModel: CloudListViewModel
    @EnvironmentObject var userViewModel: UserViewModel
    
    @State private var searchText = ""
    @State private var isShowingDeleteBothActionSheet: Bool = false
    @State private var isShowingDeleteActionSheet: Bool = false
    
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
                        
                        CloudListHeaderSectionView(cloudList: cloudListViewModel.cloudList)
                        
                        if cloudListViewModel.cloudList.clouds.count == 0 {
                            
                            NavigationLink {
                                EmptyView()
                            } label: {
                                
                                HStack {
                                    
                                    Rectangle()
                                        .aspectRatio(1, contentMode: .fit)
                                        .foregroundStyle(Color.fill)
                                        .frame(width: 75)
                                        .overlay {
                                            Image(systemName: "plus")
                                                .resizable()
                                                .scaledToFit()
                                                .padding(25)
                                                .bold()
                                                .foregroundStyle(.highlight)
                                        }
                                        .clipShape(RoundedRectangle(cornerRadius: 10))
                                    
                                    Text("Add a Cloud")
                                        .padding(.leading)
                                        .font(.headline)
                                    
                                }
                            }
                            .listRowBackground(Color.clear)
                            .listSectionSeparator(.visible, edges: .top)
    
                            
                        } else {
                        
                            ForEach(searchResults, id: \.id) { cloudListItem in
                                
                                ZStack {
                                    NavigationLink(destination: destinationView(for: cloudListItem)) {
                                        EmptyView()
                                    }.opacity(0)
                                    
                                    CloudListRowView(item: cloudListItem)
                                        .environmentObject(self.userViewModel)
                                        .environmentObject(self.cloudListViewModel)
                                }
                                .swipeActions(edge: .trailing) {
                                    Button {
                                        isShowingDeleteBothActionSheet = true
                                    } label: {
                                        Image(systemName: "trash")
                                    }
                                    .tint(.red)
                                }
                                .contextMenu {
                                    Button(role: .destructive) {
                                        cloudListViewModel.removeCloud(withID: cloudListItem.listID)
                                    } label: {
                                        Label("Remove from List", systemImage: "minus.circle")
                                            .foregroundStyle(.red)
                                    }
                                    
                                    Divider()
                                    
                                    if cloudListItem.isScanned {
                                        
                                        Button(role: .destructive) {
                                            userViewModel.removeFromCollection(withID: cloudListItem.id)
                                        } label: {
                                            Label("Delete from Library", systemImage: "trash")
                                                .foregroundStyle(.red)
                                        }
                                    }
                                        
                                    Button {
                                        print("Add to List")
                                    } label: {
                                        Label("Add to a CloudList...", systemImage: "text.badge.plus")
                                    }
                                    
                                } preview: {
                                    destinationView(for: cloudListItem)
                                }
                                .confirmationDialog(cloudListItem.isScanned ? "Would you like to remove this cloud from this cloudlist or delete it from your library and all cloudlists?" : "Would you like to remove this cloud from this cloudlist?", isPresented: $isShowingDeleteBothActionSheet) {
                                    Button(role: .destructive) {
                                        cloudListViewModel.removeCloud(withID: cloudListItem.listID)
                                    } label: {
                                        Text("Remove from This CloudList")
                                    }
                                    
                                    if cloudListItem.isScanned {
                                        
                                        Button(role: .destructive) {
                                            userViewModel.removeFromCollection(withID: cloudListItem.id)
                                        } label: {
                                            Text("Delete from Library")
                                        }
                                    }
                                }
                                .onAppear {
                                    guard let window = (UIApplication.shared.connectedScenes.first as? UIWindowScene)?.windows.first else { return }
                                    
                                    window.overrideUserInterfaceStyle = .dark
                                }
                                
                                
                                
                                
                            }
                            .listRowBackground(Color.clear)
                            .listSectionSeparator(.visible, edges: .top)
                        }
                        
                    }
                    .listStyle(.plain)
                    .if(cloudListViewModel.cloudList.clouds.count > 0, content: { view in
                        view.searchable(text: $searchText, placement: .toolbar)
                    })
                }
            }
        }
//        .environmentObject(cloudListViewModel)
    }
    
    var searchResults: [CloudListItem] {
        if searchText.isEmpty {
            return cloudListViewModel.cloudList.clouds
        } else {
            return cloudListViewModel.cloudList.clouds.filter { $0.cloud.name.contains(searchText) }
        }
    }
}

struct CloudListHeaderSectionView: View {
    
    @Environment(\.isSearching) private var isSearching
    var cloudList: CloudListModel
    
    var body: some View {
        if !isSearching {
            Section {
                HStack {
                    
                    Spacer()
                    
                    VStack {
                        CloudListImageView(cloudList: cloudList)
                            .frame(width: 225)
                            
                        Text(cloudList.title)
                            .font(.title3)
                            .bold()
                            .padding(.top)
                            .foregroundStyle(.testText)
                        
                    }
                    
                    Spacer()
                }
                    .padding(.vertical)
                    .shadow(radius: 10)
                
            }
            .listRowBackground(Color.clear)
            .listSectionSeparator(.hidden)
        }
    }
}

struct CloudListRowView: View {
    
    var item: CloudListItem
    @EnvironmentObject var cloudListViewModel: CloudListViewModel
    @EnvironmentObject var userViewModel: UserViewModel
    
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
            
            Menu {
                Button(role: .destructive) {
                    cloudListViewModel.removeCloud(withID: item.listID)
                } label: {
                    Label("Remove from List", systemImage: "minus.circle")
                        .foregroundStyle(.red)
                }
                
                Divider()
                
                if item.isScanned {
                    Button(role: .destructive) {
                        userViewModel.removeFromCollection(withID: item.id)
                    } label: {
                        Label("Delete from Library", systemImage: "trash")
                            .foregroundStyle(.red)
                    }
                }
                
                Button {
                    print("Add to List")
                } label: {
                    Label("Add to a CloudList...", systemImage: "text.badge.plus")
                }

            } label: {
                Image(systemName: "ellipsis")
                    .foregroundStyle(.testText)
            }
        }
        
    }
}

struct CloudListImageView: View {
    
    var cloudList: CloudListModel
    
    var body: some View {
        
        Rectangle()
            .aspectRatio(1, contentMode: .fit)
            .foregroundStyle(.clear)
            .overlay {
                if cloudList.clouds.count == 0 {
                    ZStack {
                        Rectangle()
                            .foregroundStyle(Color.fill)
                        
                        GeometryReader { geometry in
                            Image(systemName: "cloud.fill")
                                .resizable()
                                .scaledToFit()
                                .frame(width: geometry.size.width * 0.5)
                                .opacity(0.4)
                                .position(x: geometry.size.width / 2, y: geometry.size.height / 2)
                        }

                    }
                } else if cloudList.clouds.count < 4 {
                    
                    Image(cloudList.clouds[0].cloud.displayImage)
                        .resizable()
                        .scaledToFill()
                    
                } else {
                    
                    ImageCollageView(cloudList: cloudList)

                    
                }
            }
            .clipShape(RoundedRectangle(cornerRadius: 10))
    }
}

struct ImageCollageView: View {
    var cloudList: CloudListModel
    
    var body: some View {
        VStack(spacing: 0) {
            HStack(spacing: 0) {
                
                Rectangle()
                    .aspectRatio(1, contentMode: .fit)
                    .foregroundStyle(.clear)
                    .overlay {
                        Image(cloudList.clouds[0].cloud.displayImage)
                            .resizable()
                            .scaledToFill()
                    }
                    .clipShape(Rectangle())
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                
                Rectangle()
                    .aspectRatio(1, contentMode: .fit)
                    .foregroundStyle(.clear)
                    .overlay {
                        Image(cloudList.clouds[1].cloud.displayImage)
                            .resizable()
                            .scaledToFill()
                    }
                    .clipShape(Rectangle())
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
            }
            
            HStack(spacing: 0) {
                Rectangle()
                    .aspectRatio(1, contentMode: .fit)
                    .foregroundStyle(.clear)
                    .overlay {
                        Image(cloudList.clouds[2].cloud.displayImage)
                            .resizable()
                            .scaledToFill()
                    }
                    .clipShape(Rectangle())
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                
                Rectangle()
                    .aspectRatio(1, contentMode: .fit)
                    .foregroundStyle(.clear)
                    .overlay {
                        Image(cloudList.clouds[3].cloud.displayImage)
                            .resizable()
                            .scaledToFill()
                    }
                    .clipShape(Rectangle())
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
            }
        }
    }
}

@ViewBuilder
func destinationView(for item: CloudListItem) -> some View {
    switch item {
    case .cloud(let cloud, _):
        CloudInfoCardView(cloud: cloud)
    case .scanAttempt(let scanAttempt, _):
        ScannedCloudInfoCardView(scanAttempt: scanAttempt)
    }
}

#Preview {
    CloudListView(cloudListViewModel: CloudListViewModel(cloudList: CloudListModel.ExampleCloudList5))
        .environmentObject(UserViewModel(user: UserModel.exampleUser))
}

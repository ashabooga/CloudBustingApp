//
//  UserLibraryView.swift
//  CloudBusting
//
//  Created by Ben Cuello-Wolffe on 7/24/24.
//

import SwiftUI

struct UserLibraryView: View {
    
    @ObservedObject var userViewModel: UserViewModel
    
    var body: some View {
        NavigationStack {
            
            ZStack {
                Color.testDark.ignoresSafeArea()
                
                LinearGradient(stops: [
                    .init(color: .testLight, location: 0),
                    .init(color: .clear, location: 0.4)
                ], startPoint: .top, endPoint: .bottom)
                .ignoresSafeArea()
                
                
                ScrollView {
                    VStack(spacing: 20) {
                        LibraryListView
                        
                        NavigationLink {
                            EmptyView()
                        } label: {
                            RecentlyScannedTitle
                        }

                        
                        LazyVGrid(columns: [GridItem(.flexible(), spacing: 20), GridItem(.flexible(), spacing: 20)], spacing: 20) {
                            ForEach(userViewModel.user.scanAttempts, id: \.id) { scanAttempt in
                                
                                NavigationLink {
                                    ScannedCloudInfoCardView(scanAttempt: scanAttempt)
                                } label: {
                                    RecentlyScannedIconView(scanAttempt: scanAttempt)
                                }
                            }
                        }
                        .padding(.horizontal)
                    }
                }
            }
            .navigationTitle("Library")
            .toolbarBackground(.ultraThinMaterial, for: .navigationBar)
            
        }
    }
}

struct RecentlyScannedIconView: View {
    
    let scanAttempt: ScanAttemptModel
    
    var body: some View {
        VStack {
            Rectangle()
                .aspectRatio(1, contentMode: .fit)
                .overlay(
                    Image(scanAttempt.imageName)
                        .resizable()
                        .scaledToFill()
                )
                .clipShape(RoundedRectangle(cornerRadius: 10))
            
            Text(scanAttempt.cloudIdentified.name)
                .frame(maxWidth: .infinity, alignment: .leading)
                .font(.footnote)
                .foregroundStyle(Color.nonInteractiveText)
            
            Text(scanAttempt.dateTime, format: Calendar.current.isDate(Date.now, equalTo: scanAttempt.dateTime, toGranularity: .year) ?  .dateTime.day().month() : .dateTime.day().month().year())
                .frame(maxWidth: .infinity, alignment: .leading)
                .font(.footnote)
                .foregroundStyle(.interactiveSymbol)
        }
    }
}

struct YourCloudsListView: View {
    
    @ObservedObject var userViewModel: UserViewModel
    @State private var searchText = ""

    var body: some View {
        
        NavigationStack {
            
            List {
                ForEach(searchResults, id: \.id) { scanAttempt in
                    NavigationLink {
                        ScannedCloudInfoCardView(scanAttempt: scanAttempt)
                    } label: {
                        YourCloudsListRowView(cloud: scanAttempt)
                    }
                }
                .listRowBackground(Color.clear)
            }
            .searchable(text: $searchText, placement: .navigationBarDrawer(displayMode: .always))
            .background{
                Color.testDark.ignoresSafeArea()
                
                LinearGradient(stops: [
                    .init(color: .testLight, location: 0),
                    .init(color: .clear, location: 0.4)
                ], startPoint: .top, endPoint: .bottom)
                .ignoresSafeArea()
            }
            .listStyle(.plain)
            .navigationTitle("Your Clouds")
            
        }
        
    }
    
    var searchResults: [ScanAttemptModel] {
        if searchText.isEmpty {
            return userViewModel.user.collection
        } else {
            return userViewModel.user.collection.filter { $0.cloudIdentified.name.contains(searchText) }
        }
    }
}

struct YourCloudsListRowView: View {
    
    var cloud: ScanAttemptModel
    
    var body: some View {
        HStack {
            Image(cloud.displayImage)
                .resizable()
                .frame(width: 100, height: 100)
                .scaledToFill()
                .clipShape(RoundedRectangle(cornerRadius: 5))
            
            VStack(alignment: .leading) {
                Text(cloud.name)
                    .font(.title3)
                    .fontWeight(.semibold)
                
                Text(cloud.abbreviation)
                    .font(.headline)
                    .opacity(0.5)
                
                Spacer()

                HStack {
                    Image(systemName: "map.fill")
                        .font(.subheadline)
                    
                    Text("Berlin, Germany")
                        .font(.headline)
                }
                .opacity(0.5)

            }
            .padding(.leading, 5)
            .foregroundStyle(.testText)
            .padding(.vertical)
            
        }
    }
}

struct CloudListsListView: View {
    @ObservedObject var userViewModel: UserViewModel
    @State private var searchText = ""

    var body: some View {
        
        NavigationStack {
            
            List {
                ForEach(searchResults, id: \.id) { cloudList in
                    NavigationLink {
                        CloudListView(cloudListViewModel: CloudListViewModel(cloudList: cloudList), userViewModel: userViewModel)
                    } label: {
                        CloudListsListRowView(cloudList: cloudList)
                    }
                    .contextMenu {
                        Button(role: .destructive) {
                            userViewModel.removeCloudList(withID: cloudList.id)
                        } label: {
                            Label("Delete CloudList", systemImage: "trash")
                                .foregroundStyle(.red)
                        }

                    } preview: {
                        VStack {
                            Image(cloudList.clouds.first?.cloud.displayImage ?? "Cindy-Otter")
                                .resizable()
                                .scaledToFill()
                                .frame(width: 300, height: 300)
                                .clipShape(RoundedRectangle(cornerRadius: 10))
                                .padding()
                            
                            HStack {
                                Text(cloudList.title)
                                Spacer()
                            }
                            .padding(.horizontal)
                            .padding(.bottom)
                            
                        }
                        .onAppear {
                            guard let window = (UIApplication.shared.connectedScenes.first as? UIWindowScene)?.windows.first else { return }
                            window.overrideUserInterfaceStyle = .dark
                        }
                    }
                }
                .listRowBackground(Color.clear)
            }
            .searchable(text: $searchText, placement: .navigationBarDrawer(displayMode: .always))
            .background{
                Color.testDark.ignoresSafeArea()
                
                LinearGradient(stops: [
                    .init(color: .testLight, location: 0),
                    .init(color: .clear, location: 0.4)
                ], startPoint: .top, endPoint: .bottom)
                .ignoresSafeArea()
            }
            .listStyle(.plain)
            .navigationTitle("Cloud Lists")
            
        }
        
    }
    
    var searchResults: [CloudListModel] {
        if searchText.isEmpty {
            return userViewModel.user.cloudLists
        } else {
            return userViewModel.user.cloudLists.filter { $0.title.contains(searchText) }
        }
    }
}

struct CloudListsListRowView: View {
    var cloudList: CloudListModel
    
    var body: some View {
        HStack {
            Image(cloudList.clouds.first?.cloud.displayImage ?? "Cindy-Otter")
                .resizable()
                .frame(width: 75, height: 75)
                .scaledToFill()
                .clipShape(RoundedRectangle(cornerRadius: 5))
            
            VStack(alignment: .leading) {
                Text(cloudList.title)
                    .font(.title3)
                    .fontWeight(.semibold)
            }
            .padding(.leading, 5)
            .foregroundStyle(.testText)
            
        }
    }
}

extension UserLibraryView {
    
    private var LibraryListView: some View {
        VStack {
            
            NavigationLink {
                YourCloudsListView(userViewModel: userViewModel)
            } label: {
                HStack {
                    Image(systemName: "cloud.fill")
                        .foregroundStyle(.highlight)
                    
                    Text("Your Clouds")
                        .padding(3)
                        .foregroundStyle(.interactiveText)
                    
                    Spacer()
                    
                    Image(systemName: "chevron.right")
                        .foregroundStyle(.interactiveSymbol)
                }
                .padding(.vertical, 5)
                .padding(.leading, 15)
                .padding(.trailing)
            }
            
            
            Divider()
                .padding(.leading, 50)
            
            
            NavigationLink {
                CloudListsListView(userViewModel: userViewModel)
            } label: {
                HStack {
                    Image(systemName: "list.bullet.clipboard.fill")
                        .foregroundStyle(.highlight)
                        .foregroundStyle(.interactiveText)
                    
                    Text("Cloud Lists")
                        .padding(3)
                        .foregroundStyle(.interactiveText)
                    
                    Spacer()
                    
                    Image(systemName: "chevron.right")
                        .foregroundStyle(.interactiveSymbol)
                        
                }
                .padding(.vertical, 5)
                .padding(.leading, 17)
                .padding(.trailing)
            }

            Divider()
                .padding(.leading, 50)
                .foregroundStyle(.interactiveSymbol)
            
            NavigationLink {
                EmptyView()
            } label: {
                HStack {
                    Image(systemName: "bookmark.fill")
                        .foregroundStyle(.highlight)
                    
                    Text("Saved Articles")
                        .padding(3)
                        .foregroundStyle(.interactiveText)
                    
                    Spacer()
                    
                    Image(systemName: "chevron.right")
                        .foregroundStyle(.interactiveSymbol)
                }
                .padding(.vertical, 5)
                .padding(.leading, 18)
                .padding(.trailing)
            }

            Divider()
                .padding(.leading, 50)
        }
        .font(.title2)
        .fontWeight(.semibold)
        .contentShape(Rectangle())
    }
    
}

extension UserLibraryView {
    private var RecentlyScannedTitle: some View {
        HStack {
            Text("Recently Scanned")
            
            Image(systemName: "chevron.right")
                .font(.title3)
                .foregroundStyle(.interactiveSymbol)
            
            Spacer()
        }
        .font(.title)
        .foregroundStyle(.nonInteractiveText)
        .bold()
        .padding(.horizontal)
    }
}

#Preview {
    UserLibraryView(userViewModel: UserViewModel(user: UserModel.exampleUser))
//    YourCloudsListView(user: UserModel.exampleUser)
}

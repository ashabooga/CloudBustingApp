//
//  UserLibraryView.swift
//  CloudBusting
//
//  Created by Ben Cuello-Wolffe on 7/24/24.
//

import SwiftUI

struct UserLibraryView: View {
    
    let user: UserModel
    
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
                            ForEach(user.scanAttempts, id: \.id) { scanAttempt in
                                
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
    
    var user: UserModel
    
//    init(user: UserModel) {
//            self.user = user
//        let appear = UINavigationBarAppearance()
//
//        let atters: [NSAttributedString.Key: Any] = [
//            .font: UIFont(name: "AmericanTypewriter-Bold", size: 35)!
//        ]
//
//        appear.largeTitleTextAttributes = atters
//        appear.titleTextAttributes = atters
//        UINavigationBar.appearance().isTranslucent = true
//        UINavigationBar.appearance().standardAppearance = appear
//        UINavigationBar.appearance().compactAppearance = appear
//        UINavigationBar.appearance().scrollEdgeAppearance = appear
//     }
    
    
    var body: some View {
        
        NavigationStack {
            
            List {
                ForEach(user.collection, id: \.id) { scanAttempt in
                    NavigationLink {
                        ScannedCloudInfoCardView(scanAttempt: scanAttempt)
                    } label: {
                        YourCloudsListRowView(cloud: scanAttempt)
                    }
                }
                .listRowBackground(Color.clear)
            }
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
}

struct YourCloudsListRowView: View {
    
    var cloud: ScanAttemptModel
    
    var body: some View {
        HStack {
            Image(cloud.imageName)
                .resizable()
                .frame(width: 100, height: 100)
                .scaledToFill()
                .clipShape(RoundedRectangle(cornerRadius: 5))
            
            VStack {
                Text(cloud.cloudIdentified.name)
                    .font(.title3)
                    .fontWeight(.semibold)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.top, 10)
                
                Text("Cu")
                    .font(.headline)
                    .opacity(0.5)
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                Spacer()
                
                Text("Common")
                    .font(.subheadline)
                    .bold()
                    .padding(5)
                    .padding(.horizontal, 5)
                    .background {
                        RoundedRectangle(cornerRadius: 15)
                            .foregroundStyle(.teal)
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.bottom, 15)

            }
            .foregroundStyle(.testText)
            
        }
        .padding(.vertical, 5)
    }
}

extension UserLibraryView {
    
    private var LibraryListView: some View {
        VStack {
            
            NavigationLink {
                YourCloudsListView(user: user)
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
                EmptyView()
            } label: {
                HStack {
                    Image(systemName: "heart.fill")
                        .foregroundStyle(.highlight)
                        .foregroundStyle(.interactiveText)
                    
                    Text("Wishlists")
                        .padding(3)
                        .foregroundStyle(.interactiveText)
                    
                    Spacer()
                    
                    Image(systemName: "chevron.right")
                        .foregroundStyle(.interactiveSymbol)
                        
                }
                .padding(.vertical, 5)
                .padding(.leading, 16)
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
    UserLibraryView(user: UserModel.exampleUser)
//    YourCloudsListView(user: UserModel.exampleUser)
}

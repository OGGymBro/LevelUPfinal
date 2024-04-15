//
//  MainTabView.swift
//  LUPinstaV2
//
//  Created by Joaquim Menezes on 25/03/24.
//

import SwiftUI

struct TraineeTabView: View {
    let user: User
    
    @State private var selectedIndex = 0
    var body: some View {
        
        //@State  var animateSearch = false
        
        TabView(selection: $selectedIndex){
            FeedView()
                .onAppear{
                    selectedIndex = 0
                }
                .tabItem {
                    Image(systemName: "house")
                }.tag(0)
            
            SearchView()
                .onAppear{
                    selectedIndex = 1
                }
                .tabItem {
                    VStack {
                        Image(systemName: "magnifyingglass")
//                            .symbolEffect(.bounce.up.byLayer,
//                                          value: animateSearch)
                    }
//                    .onTapGesture {
//                        animateSearch.toggle()
//                    }
                        
                }.tag(1)
            
            UploadPostView(tabIndex: $selectedIndex)
                .onAppear{
                    selectedIndex = 2
                }
                .tabItem {
                    Image(systemName: "plus.square")
                }.tag(2)
            
            //MainMessagesView(user: user)
            MainMessagesView()
                .onAppear{
                    selectedIndex = 3
                }
                .tabItem {
                    Image(systemName: "graduationcap.fill")
                }.tag(3)
            
            CurrentUserProfileView(user: user)
                .onAppear{
                    selectedIndex = 4
                }
                .tabItem {
                    Image(systemName: "person")
                    Text("Profile")
                }.tag(4)
            
            Text("extra feature")
                .onAppear{
                    selectedIndex = 5
                }
                .tabItem {
                    Image(systemName: "graduationcap.fill")
                        
                    Text("Extra feature")
                }.tag(5)
            

        }
        .accentColor(.green)
    }
}

#Preview {
    TraineeTabView(user: User.MOCK_USERS[0])
}

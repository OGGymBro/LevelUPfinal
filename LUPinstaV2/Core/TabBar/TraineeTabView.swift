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
            
            RecipeBaseView()
                .onAppear{
                    selectedIndex = 0
                }
                .tabItem {
                    Image(systemName: "fork.knife")
                    Text("Recipes")
                }.tag(0)
            
            SearchView()
                .onAppear{
                    selectedIndex = 1
                }
                .tabItem {
                    VStack {
                        Image(systemName: "magnifyingglass")
                        Text("Finder")
                    }
                        
                }.tag(1)
            
            CurrentUserProfileView(user: user)
                .onAppear{
                    selectedIndex = 2
                }
                .tabItem {
                    Image(systemName: "person")
                    Text("Profile")
                }.tag(2)
            
            //MainMessagesView(user: user)
            MainMessagesView()
                .onAppear{
                    selectedIndex = 3
                }
                .tabItem {
                    Image(systemName: "graduationcap.fill")
                    Text("Mentorship")
                }.tag(3)
            
            UploadPostView(tabIndex: $selectedIndex)
                .onAppear{
                    selectedIndex = 4
                }
                .tabItem {
                    Image(systemName: "plus.square")
                    Text("Upload Post")
                }.tag(4)
            
            
            FeedView()
                .onAppear{
                    selectedIndex = 5
                }
                .tabItem {
                    Image(systemName: "house")
                    Text("Feed")
                }.tag(5)
            
            AlarmSetterView()
                .onAppear{
                    selectedIndex = 6
                }
                .tabItem {
                    Image(systemName: "alarm.waves.left.and.right")
                    Text("Progressive Alarm")
                }
                .tag(6)
            
         
            
           

        }
        .accentColor(.green)
    }
}

#Preview {
    TraineeTabView(user: User.MOCK_USERS[0])
}

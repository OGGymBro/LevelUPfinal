//
//  ProfileView.swift
//  LUPinstaV2
//
//  Created by Joaquim Menezes on 25/03/24.
//

import SwiftUI

struct ProfileView: View {
    
    let user: User
    
    private let gridItems: [GridItem] = [
        .init(.flexible(), spacing: 1),
        .init(.flexible(), spacing: 1),
        .init(.flexible(), spacing: 1)
    ]
    
     var posts:[Post] {
        return Post.MOCK_POSTS.filter({$0.user?.username == user.username})
    }
    
    var body: some View {
    //    NavigationStack {
            ScrollView{
                
                //header
                ProfileHeaderView(user: user)
                
                
                
                //Post grid view
               PostGridView(posts: posts)
            }
            .navigationTitle("Profile")
            .navigationBarTitleDisplayMode(.inline)
            
            

       // }
        
        
    }
}

#Preview {
    ProfileView(user: User.MOCK_USERS[0])
}

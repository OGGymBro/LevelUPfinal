//
//  ProfileView.swift
//  LUPinstaV2
//
//  Created by Joaquim Menezes on 25/03/24.
//

import SwiftUI

struct ProfileView: View {
    let user: User
    
    var body: some View {
        //    NavigationStack {
        ScrollView{
            
            //header
            ProfileHeaderView(user: user)
            
            //Post grid view
            PostGridView(user: user)
        }
        .navigationTitle("Profile")
        .navigationBarTitleDisplayMode(.inline)
        
        // }
    }
}

#Preview {
    ProfileView(user: User.MOCK_USERS[0])
}

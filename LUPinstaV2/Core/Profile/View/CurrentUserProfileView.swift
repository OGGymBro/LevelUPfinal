//
//  CurrentUserProfileView.swift
//  LUPinstaV2
//
//  Created by Joaquim Menezes on 25/03/24.
//

import SwiftUI

struct CurrentUserProfileView: View {
    
    let user: User

    var body: some View {
        NavigationStack {
            ScrollView{
                
                //header
                ProfileHeaderView(user: user)
                
                
                
                //Post grid view
                PostGridView(user: user)
            }
            .navigationTitle("Profile")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {
                        // Action to perform when the button is tapped
                        AuthService.shared.signout()
                         
                    }) {
                        Image(systemName: "figure.run")
                            .foregroundColor(.green)
                    }
                }
        }
        }
    }
}

#Preview {
    CurrentUserProfileView(user: User.MOCK_USERS[0])
}

//
//  ProfileHeaderView.swift
//  LUPinstaV2
//
//  Created by Joaquim Menezes on 25/03/24.
//

import SwiftUI

struct ProfileHeaderView: View {
    
    let user: User
    @State private var showEditProfile = false
    
    var body: some View {
        VStack (spacing:25) {
            
            HStack (spacing:20){
                //pics
                Image(user.profileImageUrl ?? "")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 80,height: 80)
                    .clipShape(Circle())
                
              
                
                HStack(spacing: 8){
                    UserStatView(Weight: 140, Exercise: "Squat")
                    UserStatView(Weight: 100, Exercise: "Bench")
                    UserStatView(Weight: 140, Exercise: "Deadlift")
                    
                }
            }
            .padding(.horizontal)
       
            
            //name / bio
            VStack(alignment: .leading,spacing: 4){
                if let fullname = user.fullname {
                    Text(fullname)
                        .font(.footnote)
                        .fontWeight(.semibold)
                }
                    
                if let bio = user.bio {
                    Text(bio)
                        .font(.footnote)
                }
                
                //
                Text(user.username)
              
            }
            .frame(maxWidth: .infinity,alignment: .leading)
            .padding(.horizontal)
         
            //action button
            
            Button(action: {
                // Action to perform when the button is tapped
                if user.isCurrentUser {
                    showEditProfile.toggle()
                }else {
                    print("Book Trainer")
                }
            }) {
                Text(user.isCurrentUser ? "Edit Profile" : "Book")
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .frame(width: 360, height: 32)
                    .foregroundColor(.black)
                    .background(user.isCurrentUser ? .cyan : .green) // Set background color to green
                    .cornerRadius(6)
                    .overlay(RoundedRectangle(cornerRadius: 6)
                        .stroke(Color.black, lineWidth: 1.0))
            }
            

            
            Divider()
        }
        .fullScreenCover(isPresented: $showEditProfile) {
            Text("Edit Profile View")
        }
    }
}

#Preview {
    ProfileHeaderView(user: User.MOCK_USERS[0])
}

//
//  CreateNewCoachMessageView.swift
//  LUPinstaV2
//
//  Created by Joaquim Menezes on 16/04/24.
//

import SwiftUI
import SDWebImageSwiftUI
import Kingfisher



struct CreateNewCoachMessageView: View {
    
    let didSelectNewUser: (User) -> ()
    
    @Environment(\.presentationMode) var presentationMode
    
    @ObservedObject var vm = CreateNewMessageViewModel()
    
    var body: some View {
        NavigationView {
            ScrollView {
                Text(vm.errorMessage)
                
                ForEach(vm.users) { user in
                    Button {
                        presentationMode.wrappedValue.dismiss()
                        didSelectNewUser(user)
                    } label: {
                        HStack(spacing: 16) {
                            //KFImage(URL(string: vm.chatUser?.profileImageUrl ?? ""))
//                            WebImage(url: URL(string: user.profileImageUrl ?? ""))
                            KFImage(URL(string: user.profileImageUrl ?? ""))
                                .resizable()
                                .scaledToFill()
                                .frame(width: 50, height: 50)
                                .clipped()
                                .cornerRadius(50)
                                .overlay(RoundedRectangle(cornerRadius: 50)
                                            .stroke(Color(.label), lineWidth: 2)
                                )
                            VStack (alignment :.leading) {
                                Text(user.username)
                                    .foregroundStyle(.green)
                                
                                Text(user.fullname ?? "")
                                    .foregroundStyle(.gray)
                            }
                            .padding(.horizontal)
                            
                            Spacer()
                        }.padding(.horizontal)
                    }
                    Divider()
                        .padding(.vertical, 8)
                    
                    
                }
            }.navigationTitle("New Message")
                .toolbar {
                    ToolbarItemGroup(placement: .navigationBarLeading) {
                        Button {
                            presentationMode.wrappedValue.dismiss()
                        } label: {
                            Text("Cancel")
                        }
                    }
                }
        }
    }
}

#Preview {
    CreateNewCoachMessageView(didSelectNewUser: {_ in })
}


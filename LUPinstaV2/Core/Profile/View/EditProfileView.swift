//
//  EditProfileView.swift
//  LUPinstaV2
//
//  Created by Joaquim Menezes on 26/03/24.
//

import SwiftUI
import PhotosUI

struct EditProfileView: View {
    
    @Environment(\.dismiss) var dismiss
    
    @StateObject var viewModel = EditProfileViewModel()
    
    
    var body: some View {
        VStack{
            
            //toolbar
            VStack {
                HStack{
                    Button("Cancel"){
                        dismiss()
                    }
                    .foregroundStyle(.red)
                    .font(.headline)
                    .fontWeight(.bold)
                    
                    Spacer()
                    
                    Text("Edit Profile")
                        .font(.headline)
                        .fontWeight(.semibold)
                    
                    Spacer()
                    
                    Button{
                        print("Upload")
                    } label: {
                        Text("Done")
                            .font(.headline)
                            .fontWeight(.bold)
                    }
                    .foregroundStyle(.green)
                }
                .padding(.horizontal)
                Divider()
            }

            
            
            
            //edit profile pic
            PhotosPicker(selection: $viewModel.selectedImage){
                VStack {
                    if let image = viewModel.profileImage {
                        image
                            .resizable()
                            .frame(width:100 ,height: 100)
                            .foregroundStyle(.green)
                            .background(.black)
                            .clipShape(Circle())
                    }
                    else {
                        Image(systemName: "person.circle")
                            .resizable()
                            .frame(width:100 ,height: 100)
                            .foregroundStyle(.green)
                            .background(.black)
                            .clipShape(Circle())
                    }
                    
                    Text("Edit Profile Picture")
                        .font(.headline)
                        .fontWeight(.bold)
                    
                    Divider()
                }
                .padding(.vertical,8)
                    
            }
            
            //edit pofile info
            VStack{
                EditProfileRowView(title: "Name",
                                   placeholder: "Enter Your Name...",
                                   text: $viewModel.fullname)
                
                EditProfileRowView(title: "Bio",
                                   placeholder: "Eneter Your Bio...",
                                   text: $viewModel.bio)
            }
            .padding(.horizontal)
            
            Spacer()
            
        }
    }
}


struct EditProfileRowView: View {
    let title: String
    let placeholder:String
    @Binding var text:String
    
    var body: some View {
        HStack{
            Text(title)
                .padding(.leading,8)
                .frame(width: 100,alignment: .leading)
            
            VStack{
                TextField(placeholder,text: $text)
                
                Divider()
            }
        }
        .font(.headline)
        .frame(height:36)
    }
}



#Preview {
    EditProfileView()
}

//
//  UploadPostView.swift
//  LUPinstaV2
//
//  Created by Joaquim Menezes on 25/03/24.
//

import SwiftUI
import PhotosUI

struct UploadPostView: View {
    @State private var isLoading = false
    
    @State private var caption = ""
    @State private var imagePickerPresented = false
    @StateObject var viewModel = UploadPostViewModel()
    @Binding var tabIndex: Int
    
    
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        ZStack {
            VStack{
                //action toolbar
                HStack{
                    Button{
                        clearPostDataAndReturnToFeed()
                    }label :{
                        Text("Cancel")
                            .foregroundStyle(.red)
                    }
                    
                    Spacer()
                    
                    Text("New Post")
                        .fontWeight(.semibold)
                    
                    Spacer()
                    
                    Button{
                        Task{
                            isLoading.toggle()
                            try await viewModel.uploadPost(caption: caption)
                            clearPostDataAndReturnToFeed()
                            isLoading.toggle()
                        }
                    }label :{
                        Text("Upload")
                            .fontWeight(.semibold)
                    }
                }
                .padding(.horizontal)
                
                //post image and caption
                HStack{
                    if let image = viewModel.postImage {
                        image
                            .resizable()
                            .scaledToFill()
                            .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/,height: 100)
                            .clipped()
                    }
                    
                    TextField("Enter Your caption...",
                              text :$caption,
                              axis: .vertical)
                }
                .padding(.horizontal)
                
                Spacer()
            }
            .onAppear{
                imagePickerPresented.toggle()
            }
            .photosPicker(isPresented: $imagePickerPresented,
                      selection: $viewModel.selectedImage)
            
            //logic
            if isLoading {
                Color.black.opacity(0.1)
                    .edgesIgnoringSafeArea(.all)
                
                LottieLoader(fileName: "gym11") // or any other loading indicator
            }
            
            
        }
    }
    
    func clearPostDataAndReturnToFeed(){
        caption = ""
        viewModel.selectedImage = nil
        viewModel.postImage = nil
        tabIndex = 0
    }
    
}

#Preview {
    UploadPostView(tabIndex: .constant(0))
}

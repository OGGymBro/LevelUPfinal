//
//  UploadPostViewModel.swift
//  LUPinstaV2
//
//  Created by Joaquim Menezes on 25/03/24.
//

import Foundation
import PhotosUI
import SwiftUI

import Firebase

@MainActor
class UploadPostViewModel: ObservableObject {
    
    @Published var selectedImage: PhotosPickerItem? {
        didSet {Task {await loadImage(fromItem:selectedImage)} }
    }
    
    @Published var postImage:Image?
    
    private var uiImage:UIImage?

    func loadImage(fromItem item: PhotosPickerItem?) async {
        guard let item = item else {return}
        
        guard let data = try? await item.loadTransferable(type: Data.self) else {return}
        guard let uiImage = UIImage(data: data) else {return}
        self.uiImage = uiImage
        self.postImage = Image(uiImage:  uiImage)
        
    }
    
    func uploadPost(caption:String) async throws {
        guard let uid = Auth.auth().currentUser?.uid else {return}
        guard let uiImage = uiImage else {return}
        
        let postRef = Firestore.firestore().collection("posts").document() //id for where the post will be stored
        guard let imgUrl = try await ImageUploader.uploadImage(image: uiImage) else {return}
        
        let post = Post(id: postRef.documentID,
                        ownerUid: uid,
                        caption: caption,
                        imageURL: imgUrl,
                        timestamp: Timestamp(),
                        likes: 0)
        
        guard let encodedPost = try? Firestore.Encoder().encode(post) else {return}
        
        try await postRef.setData(encodedPost)
        
    }
    
}

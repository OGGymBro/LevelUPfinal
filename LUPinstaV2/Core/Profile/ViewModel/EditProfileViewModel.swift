//
//  EditProfileViewModel.swift
//  LUPinstaV2
//
//  Created by Joaquim Menezes on 26/03/24.
//

import PhotosUI
import SwiftUI

import Firebase

@MainActor
class EditProfileViewModel:ObservableObject {
    @Published var user: User //get user
    
    @Published var selectedImage: PhotosPickerItem? {
        didSet {Task {await loadImage(fromItem:selectedImage)} }
    }
    
    @Published var profileImage:Image?
    
    @Published  var fullname = ""
    @Published  var bio = ""
    
    init(user:User){  //init user when file is called
        self.user = user
    }

    func loadImage(fromItem item: PhotosPickerItem?) async {
        guard let item = item else {return}
        
        guard let data = try? await item.loadTransferable(type: Data.self) else {return}
        guard let uiImage = UIImage(data: data) else {return}
        self.profileImage = Image(uiImage:  uiImage)
        
    }
    
    func updateUserData() async throws {
        //update profile if changed
        
        
        
        var data = [String:Any]()
        //update name if changed
        if !fullname.isEmpty && user.fullname != fullname {
            data["fullname"] = fullname
        }
        
        //update bio if changed
        if !bio.isEmpty && user.bio != bio {
            data["bio"] = bio
        }
        
        if !data.isEmpty {
            try await Firestore.firestore()
                .collection("users")
                .document(user.id)
                .updateData(data)
        }
        
    }
    
    
}
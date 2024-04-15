//
//  CreateNewMessageViewModel.swift
//  LUPinstaV2
//
//  Created by Joaquim Menezes on 15/04/24.
//

import Foundation

class CreateNewMessageViewModel: ObservableObject {
    
    @Published var users = [User]()
    @Published var errorMessage = ""
    
    init() {
        fetchAllUsers()
    }
    
//    private func fetchAllTrainersWhereCurrentUserIsInterested() {
//          FirebaseManager.shared.firestore
        //.collection("users")
//        .getDocuments
    //
//    }

    private func fetchAllUsers() {
        FirebaseManager.shared.firestore.collection("users")
            .getDocuments { documentsSnapshot, error in
                if let error = error {
                    self.errorMessage = "Failed to fetch users: \(error)"
                    print("Failed to fetch users: \(error)")
                    return
                }
                
                documentsSnapshot?.documents.forEach({ snapshot in
                    let data = snapshot.data()
                    let user = User(data: data)
                    if user.uid != FirebaseManager.shared.auth.currentUser?.uid {
                        self.users.append(.init(data: data))
                    }
                    
                    
                })
            }
    }
}

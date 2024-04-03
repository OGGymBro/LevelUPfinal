//
//  UserService.swift
//  LUPinstaV2
//
//  Created by Joaquim Menezes on 25/03/24.
//

import Foundation
import Firebase

struct UserService{
    
    
    static func fetchUser(withUid uid: String) async throws -> User{
        let snapshot = try await  Firestore.firestore()
            .collection("users")
            .document(uid)
            .getDocument()
    
        return try snapshot.data(as: User.self)
    }
    
    static func fetchAllUsers() async throws -> [User] {
        let snapshot = try await Firestore.firestore()
            .collection("users")
            .getDocuments()
        
        return snapshot.documents.compactMap({try? $0.data(as: User.self)})
    }
    
    static func fetchAllTrainers() async throws -> [User] {
        guard let currentUserUID = Auth.auth().currentUser?.uid else {
               // Throw an error or return an empty array if current user UID is nil
            return []
           }
        let snapshot = try await Firestore.firestore()
            .collection("users")
            .whereField("role", isEqualTo: "Coach")
            //.whereField("uid", isNotEqualTo: currentUserUID) // Exclude current user
            .getDocuments()
        
        return snapshot.documents.compactMap({try? $0.data(as: User.self)})
    }
    
}

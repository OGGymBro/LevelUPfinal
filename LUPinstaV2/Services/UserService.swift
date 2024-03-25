//
//  UserService.swift
//  LUPinstaV2
//
//  Created by Joaquim Menezes on 25/03/24.
//

import Foundation
import Firebase

struct UserService{
    
   
    static func fetchAllUsers() async throws -> [User] {
     let snapshot = try await Firestore.firestore().collection("users").getDocuments()
        
        return snapshot.documents.compactMap({try? $0.data(as: User.self)})
    }
    
}

//
//  FirebaseManager.swift
//  LUPinstaV2
//
//  Created by Joaquim Menezes on 13/04/24.
//

import Foundation
import Firebase
import FirebaseStorage

class FirebaseManager: NSObject {
    
    let auth: Auth
    let storage: Storage
    let firestore: Firestore
    
    var currentUser: User?
    
    static let shared = FirebaseManager()
    
    override init() {
//        FirebaseApp.configure()
        
        self.auth = Auth.auth()
        self.storage = Storage.storage()
        self.firestore = Firestore.firestore()
        
        super.init()
    }
    
}

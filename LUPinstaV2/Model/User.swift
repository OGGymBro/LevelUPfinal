//
//  User.swift
//  LUPinstaV2
//
//  Created by Joaquim Menezes on 25/03/24.
//

import Foundation
import Firebase

struct User: Identifiable,Hashable,Codable {
    var id: String{uid}
    
    //reformatted for messaging
    let uid: String
    let email: String
    var profileImageUrl: String?
    
    let role: String //important
    
    var username: String
    var fullname: String?
    var bio: String?
    
    //added init for messaging
    //so while initialising user init all
    init(data: [String: Any]) {
        self.uid = data["uid"] as? String ?? ""
        self.email = data["email"] as? String ?? ""
        self.profileImageUrl = data["profileImageUrl"] as? String ?? ""
        self.role = data["role"] as? String ?? ""
        self.username = data["username"] as? String ?? ""
        self.fullname = data["fullname"] as? String ?? ""
        self.bio = data["bio"] as? String ?? ""
    }

    
    var isCurrentUser:Bool {
        guard let currentUid = Auth.auth().currentUser?.uid else {return false}
        return currentUid == id
    }
    
    
}


extension User {
    static var MOCK_USERS:[User] = [
//        .init(id: NSUUID().uuidString,
//              email: "jotoro@example.com", role: "Trainee",
//              username: "jotaro_kujo",
//              profileImageUrl: nil,
//              fullname: "jotoro kujo",
//              bio: "ora ora"),
//        
//            .init(id: NSUUID().uuidString,
//                  email: "dio@example.com", role: "Trainee",
//                  username: "kono_dio_da",
//                  profileImageUrl: nil,
//                  fullname: "dio ",
//                  bio: "muda muda muda"),
//        
//            .init(id: NSUUID().uuidString,
//                  email: "pucci@example.com", role: "Coach",
//                  username: "xim_sama",
//                  profileImageUrl: nil,
//                  fullname: "pucci sama",
//                  bio: "I love the full moon"),
//        
//            .init(id: NSUUID().uuidString,
//                  email: "kira@example.com", role: "Coach",
//                  username: "kira_yoshkaghe",
//                  profileImageUrl: nil,
//                  fullname: "kira yoshkaghe",
//                  bio: "watshino no nawa kirsa yoshkage"),
//        
//            .init(id: NSUUID().uuidString,
//                  email: "giono@example.com", role: "Coach",
//                  username: "giorono_giovanna",
//                  profileImageUrl: nil,
//                  fullname: "giorno giovanna",
//                  bio: "Golden windo"),
        
            
    ]
}

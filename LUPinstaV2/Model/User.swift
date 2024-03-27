//
//  User.swift
//  LUPinstaV2
//
//  Created by Joaquim Menezes on 25/03/24.
//

import Foundation
import Firebase

struct User: Identifiable,Hashable,Codable {
    let id: String
    let email: String
    let role: String //important
    
    var username: String
    var profileImageUrl: String?
    var fullname: String?
    var bio: String?
    
    var isCurrentUser:Bool {
        guard let currentUid = Auth.auth().currentUser?.uid else {return false}
        return currentUid == id
    }
    
}


extension User {
    static var MOCK_USERS:[User] = [
        .init(id: NSUUID().uuidString,
              email: "jotoro@example.com", role: "Trainee",
              username: "jotaro_kujo",
              profileImageUrl: nil,
              fullname: "jotoro kujo",
              bio: "ora ora"),
        
            .init(id: NSUUID().uuidString,
                  email: "dio@example.com", role: "Trainee",
                  username: "kono_dio_da",
                  profileImageUrl: nil,
                  fullname: "dio ",
                  bio: "muda muda muda"),
        
            .init(id: NSUUID().uuidString,
                  email: "pucci@example.com", role: "Coach",
                  username: "xim_sama",
                  profileImageUrl: nil,
                  fullname: "pucci sama",
                  bio: "I love the full moon"),
        
            .init(id: NSUUID().uuidString,
                  email: "kira@example.com", role: "Coach",
                  username: "kira_yoshkaghe",
                  profileImageUrl: nil,
                  fullname: "kira yoshkaghe",
                  bio: "watshino no nawa kirsa yoshkage"),
        
            .init(id: NSUUID().uuidString,
                  email: "giono@example.com", role: "Coach",
                  username: "giorono_giovanna",
                  profileImageUrl: nil,
                  fullname: "giorno giovanna",
                  bio: "Golden windo"),
    ]
}

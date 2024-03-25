//
//  User.swift
//  LUPinstaV2
//
//  Created by Joaquim Menezes on 25/03/24.
//

import Foundation

struct User: Identifiable,Hashable,Codable {
    let id: String
    let email: String
    
    var username: String
    var profileImageUrl: String?
    var fullname: String?
    var bio: String?
}


extension User {
    static var MOCK_USERS:[User] = [
        .init(id: NSUUID().uuidString,
              email: "jotoro@example.com",
              username: "jotaro_kujo",
              profileImageUrl: "jotaro",
              fullname: "jotoro kujo",
              bio: "ora ora"),
        
            .init(id: NSUUID().uuidString,
                  email: "dio@example.com",
                  username: "kono_dio_da",
                  profileImageUrl: "dio",
                  fullname: "dio ",
                  bio: "muda muda muda"),
        
            .init(id: NSUUID().uuidString,
                  email: "pucci@example.com",
                  username: "xim_sama",
                  profileImageUrl: "pucci",
                  fullname: "pucci sama",
                  bio: "I love the full moon"),
        
            .init(id: NSUUID().uuidString,
                  email: "kira@example.com",
                  username: "kira_yoshkaghe",
                  profileImageUrl: "kira",
                  fullname: "kira yoshkaghe",
                  bio: "watshino no nawa kirsa yoshkage"),
        
            .init(id: NSUUID().uuidString,
                  email: "giono@example.com",
                  username: "giorono_giovanna",
                  profileImageUrl: "giorno",
                  fullname: "giorno giovanna",
                  bio: "Golden windo"),
    ]
}

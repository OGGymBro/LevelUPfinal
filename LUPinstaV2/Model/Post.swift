//
//  Post.swift
//  LUPinstaV2
//
//  Created by Joaquim Menezes on 25/03/24.
//

import Foundation

struct Post: Identifiable,Hashable,Codable {
    let id: String
    let ownerUid: String
    let caption:String
    let imageURL:String
    let timestamp: Date
    
    var likes: Int
    var user: User?
    
}

extension Post {
    static var MOCK_POSTS:[Post] = [
        .init(id: NSUUID().uuidString,
              ownerUid: NSUUID().uuidString,
              caption: "xim sama",
              imageURL: "pucci",
              timestamp: Date(),
              likes: 23,
              user: User.MOCK_USERS[0]),
    
            .init(id: NSUUID().uuidString,
                  ownerUid: NSUUID().uuidString,
                  caption: "jotaro ora ora",
                  imageURL: "jotaro",
                  timestamp: Date(),
                  likes: 69,
                  user: User.MOCK_USERS[1]),
        
            .init(id: NSUUID().uuidString,
                  ownerUid: NSUUID().uuidString,
                  caption: "golden windo",
                  imageURL: "giorno",
                  timestamp: Date(),
                  likes: 11,
                  user: User.MOCK_USERS[2]),
        
            .init(id: NSUUID().uuidString,
                  ownerUid: NSUUID().uuidString,
                  caption: "meow",
                  imageURL: "kira",
                  timestamp: Date(),
                  likes: 121,
                  user: User.MOCK_USERS[3]),
        
            .init(id: NSUUID().uuidString,
                  ownerUid: NSUUID().uuidString,
                  caption: "dio muda muda",
                  imageURL: "dio",
                  timestamp: Date(),
                  likes: 101,
                  user: User.MOCK_USERS[4]),
    
    
    ]
}

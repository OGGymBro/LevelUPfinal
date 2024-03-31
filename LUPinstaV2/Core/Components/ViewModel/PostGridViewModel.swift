//
//  PostGridViewModel.swift
//  LUPinstaV2
//
//  Created by Joaquim Menezes on 27/03/24.
//

import Foundation

class PostGridViewModel: ObservableObject {
    private let user: User
    @Published var posts = [Post]()
    
    init(user:User) {
        self.user = user
        
        Task {
            try await fetchUserPosts()
        }
    }
    
    @MainActor
    func fetchUserPosts() async throws {
        self.posts = try await PostService.fetchUserPosts(uid: user.id)
        
        for i in 0 ..< posts.count {
            posts[i].user = self.user
        }
    }
}
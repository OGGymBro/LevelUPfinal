//
//  FeedViewMOdel.swift
//  LUPinstaV2
//
//  Created by Joaquim Menezes on 27/03/24.
//

import Foundation
import Firebase


class FeedViewModel:ObservableObject {
    @Published var posts = [Post]()
    
    init(){
        Task {
            try await fetchPosts()
        }
    }
    
    @MainActor
    func fetchPosts() async throws {
        self.posts = try await PostService.fetchFeedPosts()
    }
}

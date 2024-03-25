//
//  SearchViewModel.swift
//  LUPinstaV2
//
//  Created by Joaquim Menezes on 25/03/24.
//

import Foundation

class SearchViewModel:ObservableObject {
    @Published var users = [User]()
    
    init() {
        Task {
            try await fetchAllUsers()
        }
    }
    
    @MainActor
    func fetchAllUsers() async throws {
        self.users = try await UserService.fetchAllUsers()
    }
}

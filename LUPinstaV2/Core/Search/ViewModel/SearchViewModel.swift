//
//  SearchViewModel.swift
//  LUPinstaV2
//
//  Created by Joaquim Menezes on 25/03/24.
//

import Foundation

class SearchViewModel:ObservableObject {
    @Published var users = [User]()
    
    @Published var searchTerm = ""
    
    var filteredUsers: [User] {
        
        guard !searchTerm.isEmpty else {return users}
        // fullname based search
//        return users.filter({$0.username.localizedCaseInsensitiveContains(searchTerm) ?? true})
        //username based search
          return users.filter({$0.username.localizedCaseInsensitiveContains(searchTerm)})
    }
    
    init() {
        Task {
            //try await fetchAllUsers()
            try await fetchAllTrainers()
        }
    }
    
//    @MainActor
//    func fetchAllUsers() async throws {
//        self.users = try await UserService.fetchAllUsers()
//    }
    
    @MainActor
    func fetchAllTrainers() async throws {
        self.users = try await UserService.fetchAllTrainers()
    }
    
    @MainActor
       func refreshUsers() async {
           do {
               self.users = try await UserService.fetchAllTrainers()
           } catch {
               // Handle error
               print("Error refreshing users: \(error)")
           }
       }
}

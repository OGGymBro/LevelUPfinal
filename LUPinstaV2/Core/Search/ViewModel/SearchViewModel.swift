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

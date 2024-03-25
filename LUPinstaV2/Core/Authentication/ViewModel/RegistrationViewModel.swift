//
//  RegistrationViewModel.swift
//  LUPinstaV2
//
//  Created by Joaquim Menezes on 25/03/24.
//

import Foundation

class RegistrationViewModel: ObservableObject {
    @Published var email = ""
    @Published var password = ""
    @Published var username = ""
    @Published var role = ""
    
    func createUser() async throws {
        try await AuthService.shared.createUser(withEmail: email,
                                                password: password,
                                                username: username,
                                                role: role)
    }
}

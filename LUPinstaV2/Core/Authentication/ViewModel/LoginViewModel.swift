//
//  LoginViewModel.swift
//  LUPinstaV2
//
//  Created by Joaquim Menezes on 25/03/24.
//

import Foundation

class LoginViewModel: ObservableObject {
    @Published var email = ""
    @Published var password = ""
    
    func signIn() async throws {
        try await AuthService.shared.login(withEmail: email, password: password)
    }
    
    var isEmailValid: Bool {
        return email.isValidEmail()
    }
    
    var isPasswordValid: Bool {
        return password.count >= 8
    }
    
    var isLoginEnabled: Bool {
        return !email.isEmpty && isEmailValid && !password.isEmpty && isPasswordValid
    }
    
}

extension String {
    func isValidEmail() -> Bool {
        // Your email validation logic here
        // Example: return true if email is valid, false otherwise
        return self.contains("@") && self.contains(".")
    }
}

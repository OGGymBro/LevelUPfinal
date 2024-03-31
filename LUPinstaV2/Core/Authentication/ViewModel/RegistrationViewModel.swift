//
//  RegistrationViewModel.swift
//  LUPinstaV2
//
//  Created by Joaquim Menezes on 25/03/24.
//

import Foundation

@MainActor
class RegistrationViewModel: ObservableObject {
    @Published var email = ""
    @Published var password = ""
    @Published var username = ""
    @Published var role = ""
    
    //email
    var isEmailValid: Bool {
            return email.isValidEmail()
        }
    
    var shouldEmailButtonBeEnabled: Bool {
            return !email.isEmpty && isEmailValid
        }
    
    
    //username
    var shouldUsernameButtonBeEnabled: Bool {
        return username.count >= 3
    }
    
    
    //password
    var shouldPasswordButtonBeEnabled: Bool {
        // Check if the password contains at least one number, one lowercase letter, one uppercase letter, and one special character
        let containsNumber = password.contains { $0.isNumber }
        let containsLowercaseLetter = password.contains { $0.isLowercase }
        let containsUppercaseLetter = password.contains { $0.isUppercase }
        let containsSpecialCharacter = password.rangeOfCharacter(from: .punctuationCharacters) != nil
        
        return password.count >= 8 && containsNumber && containsLowercaseLetter && containsUppercaseLetter && containsSpecialCharacter
    }
    
    var shouldRoleButtonBeEnabled: Bool {
        return !role.isEmpty
    }


    
    
//    var isPasswordEnabled: Bool {
//            return !password.isEmpty && isPasswordValid
//        }
    
    func createUser() async throws {
        try await AuthService.shared.createUser(withEmail: email,
                                                password: password,
                                                username: username,
                                                role: role)
        email = ""
        password = ""
        username = ""
        role = ""
    }
    
    //password individual check
    var passwordHasGoodLength:Bool {
        return password.count >= 8
    }

    var passwordHasLowercase:Bool {
        return password.contains { $0.isLowercase }
    }
    
    var passwordHasUppercase:Bool {
        return password.contains { $0.isUppercase }
    }
    
    var passwordHasNumbers:Bool {
        return password.contains { $0.isNumber }
    }
    
    var passwordHasSpecialCharacters:Bool {
        return password.rangeOfCharacter(from: .punctuationCharacters) != nil
    }
    
}

//extension String {
//    func isValidEmail() -> Bool {
//        // Your email validation logic here
//        // Example: return true if email is valid, false otherwise
//        return self.contains("@") && self.contains(".")
//    }
//}

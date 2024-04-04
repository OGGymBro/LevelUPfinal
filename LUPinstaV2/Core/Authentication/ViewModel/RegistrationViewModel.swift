//
//  RegistrationViewModel.swift
//  LUPinstaV2
//
//  Created by Joaquim Menezes on 25/03/24.
//

import Foundation
import Firebase

@MainActor
class RegistrationViewModel: ObservableObject {
    @Published var email = ""
    @Published var password1 = ""
    @Published var password2 = ""
    @Published var username = ""
    @Published var role = ""
    
    //to check username availability
    @Published  var isUsernameAvailable: Bool = true
    
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
    
    func checkUsernameAvailability() {
        // Query Firebase to check if username exists
        let db = Firestore.firestore()
        db.collection("users")
            .whereField("username", isEqualTo: username)
            .getDocuments { (querySnapshot, error) in
            guard let documents = querySnapshot?.documents else {
                print("Error fetching documents: \(error!)")
                return
            }
            
            // If there are no documents, the username is available
            self.isUsernameAvailable = documents.isEmpty
        }
    }
    
    
    //password
    var shouldPasswordButtonBeEnabled: Bool {
        // Check if the password contains at least one number, one lowercase letter, one uppercase letter, and one special character
        let containsNumber = password1.contains { $0.isNumber }
        let containsLowercaseLetter = password1.contains { $0.isLowercase }
        let containsUppercaseLetter = password1.contains { $0.isUppercase }
        let containsSpecialCharacter = password1.rangeOfCharacter(from: .punctuationCharacters) != nil
        
        return password1.count >= 8 &&
                containsNumber &&
                containsLowercaseLetter &&
                containsUppercaseLetter &&
                containsSpecialCharacter &&
                (password1 == password2)
    }
    
    var shouldRoleButtonBeEnabled: Bool {
        return !role.isEmpty
    }


    
    
//    var isPasswordEnabled: Bool {
//            return !password.isEmpty && isPasswordValid
//        }
    
    func createUser() async throws {
        try await AuthService.shared.createUser(withEmail: email,
                                                password: password1,
                                                username: username,
                                                role: role)
        email = ""
        password1 = ""
        username = ""
        role = ""
    }
    
    //password individual check
    var passwordHasGoodLength:Bool {
        return password1.count >= 8
    }

    var passwordHasLowercase:Bool {
        return password1.contains { $0.isLowercase }
    }
    
    var passwordHasUppercase:Bool {
        return password1.contains { $0.isUppercase }
    }
    
    var passwordHasNumbers:Bool {
        return password1.contains { $0.isNumber }
    }
    
    var passwordHasSpecialCharacters:Bool {
        return password1.rangeOfCharacter(from: .punctuationCharacters) != nil
    }
    
}

//extension String {
//    func isValidEmail() -> Bool {
//        // Your email validation logic here
//        // Example: return true if email is valid, false otherwise
//        return self.contains("@") && self.contains(".")
//    }
//}

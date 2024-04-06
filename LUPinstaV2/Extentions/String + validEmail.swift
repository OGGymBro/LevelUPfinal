//
//  String + validEmail.swift
//  LUPinstaV2
//
//  Created by Joaquim Menezes on 31/03/24.
//

import Foundation

extension String {
    func isValidEmail() -> Bool {
        // Regular expression for email validation
        let emailRegex = "^[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}$"
        let emailPredicate = NSPredicate(format: "SELF MATCHES %@", emailRegex)
        
        // Check if the email format matches the regex pattern
        guard emailPredicate.evaluate(with: self) else {
            // If the format is invalid, return false
            return false
        }
        
        // Check for additional validations
        
        // Check if the email doesn't start or end with '@'
        guard !self.hasPrefix("@") && !self.hasSuffix("@") else {
            return false
        }
        
        // Check if the email doesn't contain consecutive dots
        guard !self.contains("..") else {
            return false
        }
        
        // Check if the email doesn't contain whitespace, newline, or tab characters
        guard !self.contains(" ") && !self.contains("\n") && !self.contains("\t") else {
            return false
        }
        
        // Check if the email contains both '@' and '.'
        return self.contains("@") && self.contains(".")
    }
}

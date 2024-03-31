//
//  String + validEmail.swift
//  LUPinstaV2
//
//  Created by Joaquim Menezes on 31/03/24.
//

import Foundation

extension String {
    func isValidEmail() -> Bool {
        // Your email validation logic here
        // Example: return true if email is valid, false otherwise
        return self.contains("@") && self.contains(".")
    }
}

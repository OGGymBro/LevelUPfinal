//
//  AuthService.swift
//  LUPinstaV2
//
//  Created by Joaquim Menezes on 25/03/24.
//

import Foundation
import FirebaseAuth

class AuthService{
    @Published var userSession:FirebaseAuth.User?
    
    static let shared = AuthService()
    
    init() {
        self.userSession = Auth.auth().currentUser
    }
    
    func login(withEmail email:String,password:String) async throws {
        
    }
    
    func createUser(withEmail email:String,password:String,username:String,role:String) async throws {
        //print("email is \(email)\npassword is \(password)\nusername is \(username)\nrole is \(role)")
    }
    
    func loadUserData() async throws {
        
    }
    
    func signout(){
        
    }
}

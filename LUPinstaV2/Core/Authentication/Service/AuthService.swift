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
    
    @MainActor
    func login(withEmail email:String,password:String) async throws {
        do {
            let result = try await Auth.auth().signIn(withEmail: email, password: password)
            self.userSession = result.user
        }catch {
            print("DEBUG: Failed to sign in user with error:\(error.localizedDescription)")
        }
    }
    
    @MainActor
    func createUser(withEmail email:String,password:String,username:String,role:String) async throws {
        //print("email is \(email)\npassword is \(password)\nusername is \(username)\nrole is \(role)")
        
        do {
            let result = try await Auth.auth().createUser(withEmail: email, password: password)
            self.userSession = result.user
        }catch {
            print("DEBUG: Failed to create user with error:\(error.localizedDescription)")
        }
        
    }
    
    func loadUserData() async throws {
        
    }
    
    func signout(){
        try? Auth.auth().signOut()
        self.userSession = nil
    }
}

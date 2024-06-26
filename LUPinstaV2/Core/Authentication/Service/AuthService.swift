//
//  AuthService.swift
//  LUPinstaV2
//
//  Created by Joaquim Menezes on 25/03/24.
//

import Foundation
import FirebaseAuth
import FirebaseFirestoreSwift
import Firebase

class AuthService{
    @Published var userSession:FirebaseAuth.User?
    @Published var currentUser:User?
    
    static let shared = AuthService()
    
    init() {
       Task {
            try await loadUserData()
        }
    }
    
    @MainActor
    func login(withEmail email:String,password:String) async throws {
        do {
            let result = try await Auth.auth().signIn(withEmail: email, password: password)
            self.userSession = result.user
            try await loadUserData()
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
            
            //print("DEBUG: Did create User")
            await uploadUserData(uid: result.user.uid,
                                 username: username,
                                 email: email,
                                 role: role)
            //print("DEBUG: Did Upload User Data")
            
        }catch {
            print("DEBUG: Failed to create user with error:\(error.localizedDescription)")
        }
        
    }
    
    @MainActor
    func loadUserData() async throws {
        self.userSession = Auth.auth().currentUser
        
        guard let currentUid = userSession?.uid else {return}
        
        self.currentUser = try await UserService.fetchUser(withUid: currentUid)
        
    }
    
    func signout(){
        try? Auth.auth().signOut()
        self.userSession = nil
        self.currentUser = nil
        
    }
    
    private func uploadUserData(uid: String, username: String, email: String, role: String) async {
        // Create a user instance using the custom initializer
        let userData: [String: Any] = [
            "uid": uid,
            "email": email,
            "role": role,
            "username": username
        ]
        let user = User(data: userData)
        
        // Assign the user to the currentUser property
        self.currentUser = user
        
        // Encode the user before sending it to Firestore
        guard let encodedUser = try? Firestore.Encoder().encode(user) else {
            // Handle the encoding failure here
            return
        }
        
        // Set the user data in Firestore
        do {
            let userRef = Firestore.firestore().collection("users").document(user.id)
            try await userRef.setData(encodedUser)
        } catch {
            // Handle the Firestore operation error here
            print("Error setting user data in Firestore: \(error)")
        }
    }

    
}

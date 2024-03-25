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
            
            await uploadUserData(uid: result.user.uid,
                                 username: username,
                                 email: email,
                                 role: role)
            
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
    
    private func uploadUserData(uid:String, username:String, email:String, role:String) async {
        let user = User(id: uid,
                        email: email,
                        role: role,
                        username: username)
        
        // encode the user before sending it to FB
        //guard let cause it might fail
        guard let encodedUser = try? Firestore.Encoder().encode(user) else {return}
        
        //set the data finally
        try? await Firestore.firestore()
            .collection("users") //which collection or table
            .document(user.id)  //what document?
            .setData(encodedUser)  //set this
    }
    
}

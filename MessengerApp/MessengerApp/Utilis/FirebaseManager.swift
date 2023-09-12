//
//  FirebaseManager.swift
//  MessengerApp
//
//  Created by Ahmed Amin on 12/09/2023.
//

import Foundation
import Firebase
import FirebaseCore


final class FirebaseManager {
    
    // MARK: - Singelton
    
    static let shared = FirebaseManager()
    
    private init() { }
    
    func setup() {
        
        FirebaseApp.configure()
    }
    
    func isUserHasLoggedBefore() -> Bool {
        
        (Auth.auth().currentUser != nil)
        
    }
    
    func login(email: String, password: String) async throws -> AuthDataResult {
        
       try await Auth.auth().signIn(withEmail: email, password: password)
    }
    
    func createUser(email: String, fullname: String, password: String) async throws -> AuthDataResult {
        
     try await Auth.auth().createUser(withEmail: email, password: password)
    }
    
    func logout() throws {
                
        try Auth.auth().signOut()
        
    }
}

//
//  FirebaseManager.swift
//  MessengerApp
//
//  Created by Ahmed Amin on 12/09/2023.
//

import Foundation
import Firebase


final class FirebaseManager {
    
    // MARK: - Singelton
    
    static let shared = FirebaseManager()
    
    private init() { }
    
    func setup() {
        
        FirebaseApp.configure()
    }
    
    func login(email: String, password: String) async throws {
        
        let userSession = try await Auth.auth().signIn(withEmail: email, password: password)
        AuthenticationManager.shared.userSession = userSession.user
        UserService.instance.fetchCurrentUserData()
    }
    
    func createUser(email: String, fullname: String, password: String) async throws {
        
        let userSession = try await Auth.auth().createUser(withEmail: email, password: password)
        try await FirestoreManager.shared.uploadUserData(email: email, fullname: fullname, id: userSession.user.uid)
        AuthenticationManager.shared.userSession = userSession.user
        UserService.instance.fetchCurrentUserData()
    }
    
    func logout() throws {
        
        try Auth.auth().signOut()
        AuthenticationManager.shared.userSession = nil
        UserService.instance.fetchCurrentUserData()
        
    }
}

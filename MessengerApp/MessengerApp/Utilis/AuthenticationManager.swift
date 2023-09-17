//
//  AuthenticationManager.swift
//  MessengerApp
//
//  Created by Ahmed Amin on 17/09/2023.
//

import Foundation
import FirebaseAuth

final class AuthenticationManager {
    
    // MARK: - Properties
    
    @Published var userSession: FirebaseAuth.User?
    
    static let shared: AuthenticationManager = AuthenticationManager()
    
    private init() {
        
        setUserSession()
        UserService.instance.fetchCurrentUserData()
    }
    
    // MARK: - Methods
    
    func setUserSession() {
        
        userSession = Auth.auth().currentUser
    }
    
    func getUserUid() -> String? {
        
        return Auth.auth().currentUser?.uid
    }
}


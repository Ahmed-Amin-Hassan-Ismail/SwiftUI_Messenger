//
//  AuthenticationManager.swift
//  MessengerApp
//
//  Created by Ahmed Amin on 17/09/2023.
//

import Foundation
import Firebase

final class AuthenticationManager {
    
    // MARK: - Properties
    
    @Published var userSession: FirebaseAuth.User?
    
    static let shared: AuthenticationManager = AuthenticationManager()
    
    private init() {
        
        self.userSession = Auth.auth().currentUser
        
    }
}


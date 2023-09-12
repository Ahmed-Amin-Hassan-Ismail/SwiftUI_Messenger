//
//  FirebaseManager.swift
//  MessengerApp
//
//  Created by Ahmed Amin on 12/09/2023.
//

import Foundation
import FirebaseCore


final class FirebaseManager {
    
    // MARK: - Singelton
    
    static let shared = FirebaseManager()
    
    private init() { }
    
    func setup() {
        
        FirebaseApp.configure()
    }
}

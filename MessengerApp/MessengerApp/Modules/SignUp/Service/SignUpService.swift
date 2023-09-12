//
//  SignUpService.swift
//  MessengerApp
//
//  Created by Ahmed Amin on 12/09/2023.
//

import Foundation


final class SignUpService {
    
    func createUser(withEmail email: String, fullname: String, password: String) async throws -> Bool {
        
        do {
            
           try await FirebaseManager.shared.createUser(email: email, fullname: fullname, password: password)
            return true
            
        } catch {
            debugPrint(ErrorHandling.catchError.errorDescription)
            return false
        }
    }
}

//
//  LoginService.swift
//  MessengerApp
//
//  Created by Ahmed Amin on 12/09/2023.
//

import Foundation


final class LoginService {
    
    
    func login(withEmail email: String, password: String) async throws ->  Bool  {
        
        do {
            
            try await FirebaseManager.shared.login(email: email, password: password)
            return true
           
        } catch {
            debugPrint(ErrorHandling.catchError.errorDescription)
            return false
        }
    }
}

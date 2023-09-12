//
//  LoginService.swift
//  MessengerApp
//
//  Created by Ahmed Amin on 12/09/2023.
//

import Foundation


final class LoginService {
    
    
    func login(withEmail email: String, password: String) async throws {
        
        do {
            
           try await FirebaseManager.shared.login(email: email, password: password)
           
        } catch {
            debugPrint(ErrorHandling.catchError)
        }
    }
}

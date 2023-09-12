//
//  ProfileService.swift
//  MessengerApp
//
//  Created by Ahmed Amin on 12/09/2023.
//

import Foundation

final class ProfileService {
    
    func logout() -> Bool {
        do {
            
            try FirebaseManager.shared.logout()
            return true
            
        } catch {
            debugPrint(ErrorHandling.catchError.localizedDescription)
            return false
            
        }
    }
}

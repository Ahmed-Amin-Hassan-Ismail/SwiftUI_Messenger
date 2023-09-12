//
//  ProfileService.swift
//  MessengerApp
//
//  Created by Ahmed Amin on 12/09/2023.
//

import Foundation

final class ProfileService {
    
    func logout() {
        do {
            
            try FirebaseManager.shared.logout()
            
        } catch {
            debugPrint(ErrorHandling.catchError)
        }
    }
}

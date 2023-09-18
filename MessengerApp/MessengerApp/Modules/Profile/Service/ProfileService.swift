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
            
            debugPrint(ErrorHandling.catchError.localizedDescription)
        }
    }
    
    func pushImageIntoStorage(imageData: Data) async throws -> URL {
        
       return try await StorageManager.shared.pushImageIntoStorage(imageData: imageData)
        
    }
    
    func updateCurrentUser(user: User?)  async throws {
        
        try await FirestoreManager.shared.updateCurrectUser(user: user)
    }
}

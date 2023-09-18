//
//  StorageManager.swift
//  MessengerApp
//
//  Created by Ahmed Amin on 18/09/2023.
//

import Foundation
import FirebaseStorage


final class StorageManager {
    
    // MARK: - Singleton
    
    static let shared: StorageManager = StorageManager()
        
    private init() { }
    
    
    func pushImageIntoStorage(imageData: Data) async throws -> URL {
        
        let ref = Storage.storage().reference(withPath: AuthenticationManager.shared.getUserUid() ?? "")
        let _ = try await ref.putDataAsync(imageData)
        return try await ref.downloadURL()
    }
}

//
//  UserService.swift
//  MessengerApp
//
//  Created by Ahmed Amin on 17/09/2023.
//

import Foundation

final class UserService {
    
    @Published var currentUser: User?
    @Published var allUsers: [User]?
    
    static let instance: UserService = UserService()
    
    private init() { }
    
    
    // MARK: - Methods
    
    
    func fetchCurrentUserData() {
        Task {
            self.currentUser = try await FirestoreManager.shared.fetchCurrentUserData()
        }
    }
    
    func fetchAllUsers() {
        Task {
            self.allUsers = try await FirestoreManager.shared.fetchAllUsers()
        }
    }
}

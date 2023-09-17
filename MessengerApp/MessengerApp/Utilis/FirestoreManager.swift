//
//  FirestoreManager.swift
//  MessengerApp
//
//  Created by Ahmed Amin on 17/09/2023.
//

import Foundation
import Firebase
import FirebaseFirestoreSwift


final class FirestoreManager {
    
    // MARK: - Singleton
    
    static let shared: FirestoreManager = FirestoreManager()
    
    private init() { }
    
    
    // MARK: - Methods
    
    func uploadUserData(email: String, fullname: String, id: String) async throws {
        let user = User(email: email, fullname: fullname)
        guard let encodedUser = try? Firestore.Encoder().encode(user) else { return }
        try await Firestore.firestore().collection(CollectionName.users).document(id).setData(encodedUser)
    }
    
    func fetchCurrentUserData() async throws -> User? {
        guard let uid = AuthenticationManager.shared.getUserUid() else { return nil }
        let snapshot = try await Firestore.firestore().collection(CollectionName.users).document(uid).getDocument()
        let user = try snapshot.data(as: User.self)
        return user
    }
    
    func fetchAllUsers() async throws -> [User] {
        let snapshot = try await Firestore.firestore().collection(CollectionName.users).getDocuments()
        let users = snapshot.documents.compactMap({ try? $0.data(as: User.self) })
        let currentUserId = AuthenticationManager.shared.getUserUid() ?? ""
        return users.filter({ $0.id != currentUserId })
    }
}


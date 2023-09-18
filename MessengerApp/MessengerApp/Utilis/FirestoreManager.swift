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
    
    private let userCollection = Firestore.firestore().collection(CollectionName.users)
    private let messageCollection = Firestore.firestore().collection(CollectionName.messages)
    
    private init() { }
    
    
    // MARK: - Methods
    
    func uploadUserData(email: String, fullname: String, id: String) async throws {
        let user = User(email: email, fullname: fullname)
        guard let encodedUser = try? Firestore.Encoder().encode(user) else { return }
        try await userCollection.document(id).setData(encodedUser)
    }
    
    func fetchCurrentUserData() async throws -> User? {
        guard let uid = AuthenticationManager.shared.getUserUid() else { return nil }
        let snapshot = try await userCollection.document(uid).getDocument()
        let user = try snapshot.data(as: User.self)
        return user
    }
    
    func fetchAllUsers() async throws -> [User] {
        let snapshot = try await userCollection.getDocuments()
        let users = snapshot.documents.compactMap({ try? $0.data(as: User.self) })
        let currentUserId = AuthenticationManager.shared.getUserUid() ?? ""
        return users.filter({ $0.id != currentUserId })
    }
    
    func sendNewMessage(_ messageText: String, toUser user: User?) {
        guard let uid = AuthenticationManager.shared.getUserUid(),
              let user = user else { return }
        let chatPartnerId = user.id
        
        let currentUserRef = messageCollection.document(uid).collection(chatPartnerId).document()
        let chatPartnerRef = messageCollection.document(chatPartnerId).collection(uid)
        
        let messageId = currentUserRef.documentID
        
        let message = Message(
            messageId: messageId,
            fromId: uid,
            toId: chatPartnerId,
            textMessage: messageText,
            timestamp: Timestamp()
        )
        
        guard let messageData = try? Firestore.Encoder().encode(message) else { return }
        
        currentUserRef.setData(messageData)
        chatPartnerRef.document(messageId).setData(messageData)
    }
    
    func fetchAllMessage(chatPartner: User?, completion: @escaping ([Message]?) -> Void) {
        guard let uid = AuthenticationManager.shared.getUserUid(),
              let chatPartnerId = chatPartner?.id else { return }
        
        let query = messageCollection.document(uid).collection(chatPartnerId).order(by: "timestamp", descending: false)
            
            query.addSnapshotListener { snapshot, error in
                guard error == nil else {
                    completion(nil)
                    return
                }
                
                guard let changes = snapshot?.documentChanges.filter({ $0.type == .added }) else { return }
                
                var messages = changes.compactMap({ try? $0.document.data(as: Message.self) })
                
                for (index, message) in messages.enumerated() where !message.isFromCurrentUser {
                    messages[index].user = chatPartner
                }
                
                completion(messages)
            }
    }
}


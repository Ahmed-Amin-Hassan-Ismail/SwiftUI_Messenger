//
//  Message.swift
//  MessengerApp
//
//  Created by Ahmed Amin on 18/09/2023.
//

import Foundation
import Firebase
import FirebaseFirestoreSwift


struct Message: Codable, Identifiable, Hashable {
    
    @DocumentID var messageId: String?
    var fromId: String?
    var toId: String?
    var textMessage: String?
    var timestamp: Timestamp?
    var user: User?
    
    var id: String {
        return messageId ?? UUID().uuidString
    }
    
    var chatPartnerId: String? {
        return (fromId == AuthenticationManager.shared.getUserUid()) ? toId : fromId
    }
    
    var isFromCurrentUser: Bool {
        return (fromId == AuthenticationManager.shared.getUserUid())
    }
}

//
//  ChatService.swift
//  MessengerApp
//
//  Created by Ahmed Amin on 18/09/2023.
//

import Foundation


final class ChatService {
    
    
    func sendNewMessage(_ textMessage: String, toUser user: User?) {
        
        FirestoreManager.shared.sendNewMessage(textMessage, toUser: user)
    }
    
    
    func fetchAllMessage(chatPartner: User?, completion: @escaping ([Message]?) -> Void) {
        
        FirestoreManager.shared.fetchAllMessage(chatPartner: chatPartner, completion: completion)
    }
}

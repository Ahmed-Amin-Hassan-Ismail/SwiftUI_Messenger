//
//  HomeService.swift
//  MessengerApp
//
//  Created by Ahmed Amin on 18/09/2023.
//

import Foundation


final class HomeService {
    
    func fetchInitialMessage(completion: @escaping (Message) -> Void) {
        
        FirestoreManager.shared.fetchInitialMessages { messages in
            
            var messages = messages
            
            for index in 0 ..< messages.count {
                let message = messages[index]
                
                FirestoreManager.shared.fetchCertainUser(withUid: message.chatPartnerId) { user in
                    messages[index].user = user
                    
                    completion(messages[index])
                }
            }
        }
    }
}

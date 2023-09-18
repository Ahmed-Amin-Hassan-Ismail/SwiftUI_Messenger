//
//  ChatViewModel.swift
//  MessengerApp
//
//  Created by Ahmed Amin on 12/09/2023.
//

import Foundation


final class ChatViewModel: ObservableObject {
    
    // MARK: - Properties
    
    @Published var user: User?
    @Published var messageText: String = ""
    
    private lazy var service = ChatService()
    
    
    // MARK: - Init
    
    init(user: User?) {
        
        self.user = user
    }
    
    
    // MARK: - Methods
    
    func didTapOnSend() {
        
        guard !messageText.isEmpty else { return }
        
        service.sendNewMessage(messageText, toUser: user)
        messageText = ""
    }
}

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
    
    
    // MARK: - Init
    
    init(user: User?) {
        
        self.user = user
    }
    
    
    // MARK: - Methods
    
    func didTapOnSend() {
        /// not implemented yet
    }
}

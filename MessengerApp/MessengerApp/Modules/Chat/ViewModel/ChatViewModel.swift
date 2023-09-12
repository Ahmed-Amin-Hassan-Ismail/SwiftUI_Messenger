//
//  ChatViewModel.swift
//  MessengerApp
//
//  Created by Ahmed Amin on 12/09/2023.
//

import Foundation


final class ChatViewModel: ObservableObject {
    
    // MARK: - Properties
    
    @Published var messageText: String = ""
    
    
    // MARK: - Methods
    
    func didTapOnSend() {
        /// not implemented yet
    }
}

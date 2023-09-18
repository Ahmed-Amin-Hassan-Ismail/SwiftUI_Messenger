//
//  HomeViewModel.swift
//  MessengerApp
//
//  Created by Ahmed Amin on 11/09/2023.
//

import Foundation
import Combine


final class HomeViewModel: ObservableObject {
    
    // MARK: - Properties
    
    @Published var showNewMessageView: Bool = false
    @Published var user: User?
    @Published var selectedUser: User?
    @Published var recentMessages: [Message] = []
    @Published var showChatView: Bool = false
    
    
    private lazy var service = HomeService()
    private var cancellables = Set<AnyCancellable>()
    
    // MARK: - Init
    
    init() {
        
        addUserSubscriber()
        observeRecentMessages()
    }
    
    // MARK: - Methods
    
    func addUserSubscriber() {

        UserService.instance.$currentUser
            .receive(on: RunLoop.main)
            .sink { [weak self] user in
                self?.user = user
            }
            .store(in: &cancellables)
    }
    
    func observeRecentMessages() {
        
        service.fetchInitialMessage { [weak self] recentMessage in
            self?.recentMessages.append(recentMessage)
        }
        
    }
}

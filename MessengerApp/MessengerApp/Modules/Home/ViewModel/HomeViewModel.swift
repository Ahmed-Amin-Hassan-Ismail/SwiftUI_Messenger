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
    @Published var user: User?                       /// current user
    @Published var selectedUser: User?              /// for navigate to chat view from new message view
    @Published var allUsers: [User]?               /// for active now view
    @Published var recentMessages: [Message] = [] /// to show recent messages for each use
    @Published var showChatView: Bool = false
    
    
    private lazy var service = HomeService()
    private var cancellables = Set<AnyCancellable>()
    
    // MARK: - Init
    
    init() {
        
        UserService.instance.fetchAllUsers()
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
        
        UserService.instance.$allUsers
            .receive(on: RunLoop.main)
            .sink { [weak self] allUsers in
                self?.allUsers = allUsers
            }
            .store(in: &cancellables)
    }
    
    func observeRecentMessages() {
        
        service.fetchInitialMessage { [weak self] recentMessage in
            self?.recentMessages.append(recentMessage)
        }
        
    }
}

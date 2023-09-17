//
//  NewMessageViewModel.swift
//  MessengerApp
//
//  Created by Ahmed Amin on 11/09/2023.
//

import Foundation
import Combine


final class NewMessageViewModel: ObservableObject {
    
    // MARK: - Properties
    
    @Published var allUsers: [User]?
    @Published var searchText: String = ""
    
    @Published var chatWihUser: User?
    
    private var cancellables = Set<AnyCancellable>()
    
    
    // MARK: - Init
    
    init() {
        
        addSubscribeOnAllUsers()
    }
    
    func addSubscribeOnAllUsers() {
        
        UserService.instance.fetchAllUsers()
        
        UserService.instance.$allUsers
            .receive(on: RunLoop.main)
            .sink { [weak self] allUser in
                self?.allUsers = allUser
            }
            .store(in: &cancellables)
    }
}

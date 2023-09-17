//
//  RootViewModel.swift
//  MessengerApp
//
//  Created by Ahmed Amin on 17/09/2023.
//

import Foundation
import Combine


final class RootViewModel: ObservableObject {
    
    @Published var userUID: String?
    
    private var cancellables = Set<AnyCancellable>()
    
    init() {
        
        setupSubscribers()
    }
    
    func setupSubscribers() {
        
        AuthenticationManager.shared.$userSession
            .receive(on: RunLoop.main)
            .sink { [weak self] userSession in
                self?.userUID = userSession?.uid
            }
            .store(in: &cancellables)
    }
    
    func isUserLoggedInBefore() -> Bool {
        
        (self.userUID != nil)
    }
    
}

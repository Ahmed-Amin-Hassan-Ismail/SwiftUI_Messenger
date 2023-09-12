//
//  SignUpViewModel.swift
//  MessengerApp
//
//  Created by Ahmed Amin on 11/09/2023.
//

import Foundation


final class SignUpViewModel: ObservableObject {
    
    // MARK: - Properties
    
    /// textField
    @Published var email: String = ""
    @Published var username: String = ""
    @Published var password: String = ""
    
    /// logo animation
    @Published var isLogoAppeared: Bool = false
    
    private lazy var service = SignUpService()
    
    
    // MARK: - Methods
    
    func didTapOnSignUp() {
        
        Task {
            
            try await service.createUser(withEmail:email, fullname: username, password: password)
        }
        
    }
}

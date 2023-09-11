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
    
    
    // MARK: - Methods
    
    func didTapOnSignUp() {
        
        /// not implemented yet
        
    }
}

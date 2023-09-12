//
//  LoginViewModel.swift
//  MessengerApp
//
//  Created by Ahmed Amin on 11/09/2023.
//

import Foundation


final class LoginViewModel: ObservableObject {
    
    // MARK: - Properties
    
    /// textField
    @Published var email: String = ""
    @Published var password: String = ""
    
    /// logo animation
    @Published var isLogoAppeared: Bool = false
    
    /// showHomeView
    @Published var shouldShowHomeView: Bool = false
    
    private lazy var service = LoginService()
    
    
    // MARK: - Methods
    
    func didTapOnForgetButton() {
        
        /// not implemented yet
        
    }
    
    @MainActor
    func didTapOnLoginButton() {
        
        Task {
            self.shouldShowHomeView = try await service.login(withEmail: email, password: password)
        }
    }
    
    func didTapOnLoginWithFacebook() {
        
        /// not implemented yet
        
    }
}

//
//  ProfileViewModel.swift
//  MessengerApp
//
//  Created by Ahmed Amin on 12/09/2023.
//

import Foundation


final class ProfileViewModel: ObservableObject {
    
    // MARK: - Properties
    
    @Published var settingsOptions = SettingOptions.allCases
    
    
    
    // MARK: - Methods
    
    func didTapOnLogout() {
        /// not implemented yet
    }
    
    func didTapOnDeleteAccount() {
        /// not implemented yet
    }
}

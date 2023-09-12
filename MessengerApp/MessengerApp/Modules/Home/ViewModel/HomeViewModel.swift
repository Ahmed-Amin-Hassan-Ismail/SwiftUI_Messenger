//
//  HomeViewModel.swift
//  MessengerApp
//
//  Created by Ahmed Amin on 11/09/2023.
//

import Foundation


final class HomeViewModel: ObservableObject {
    
    // MARK: - Properties
    
    @Published var showNewMessageView: Bool = false
    @Published var showProfileView: Bool = false
}

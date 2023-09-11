//
//  NewMessageViewModel.swift
//  MessengerApp
//
//  Created by Ahmed Amin on 11/09/2023.
//

import Foundation


final class NewMessageViewModel: ObservableObject {
    
    // MARK: - Properties
    
    @Published var searchText: String = ""
}

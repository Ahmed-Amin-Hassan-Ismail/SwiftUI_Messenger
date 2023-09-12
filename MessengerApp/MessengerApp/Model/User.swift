//
//  User.swift
//  MessengerApp
//
//  Created by Ahmed Amin on 12/09/2023.
//

import SwiftUI



struct User: Codable, Identifiable, Hashable {
    
    var id: String = UUID().uuidString
    var email: String?
    var fullname: String?
    var profileImageUrl: String?
    var profileImageData: Data?
    
    var imageUrl: URL? {
        return URL(string: profileImageUrl ?? "")
    }
}

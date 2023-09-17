//
//  User.swift
//  MessengerApp
//
//  Created by Ahmed Amin on 12/09/2023.
//

import Foundation
import FirebaseFirestoreSwift



struct User: Codable, Identifiable, Hashable {
    
    @DocumentID var uid: String?
    var email: String?
    var fullname: String?
    var profileImageUrl: String?
    var profileImageData: Data?
    
    var id: String {
        return uid ?? UUID().uuidString
    }
    
    var imageUrl: URL? {
        return URL(string: profileImageUrl ?? "")
    }
}

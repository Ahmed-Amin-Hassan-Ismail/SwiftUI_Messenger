//
//  PreviewProvider.swift
//  MessengerApp
//
//  Created by Ahmed Amin on 12/09/2023.
//

import SwiftUI


extension PreviewProvider {
    
    static var dev: DeveloperPreview {
        
        return DeveloperPreview.instance
    }
}


class DeveloperPreview {
    
    static let instance = DeveloperPreview()
    
    private init() { }
    
    let user = UserModel(email: "ahmedAmin@gmail.com",
                    fullname: "Ahmed Amin",
                    profileImageUrl: "https://picsum.photos/id/1/400/730")
}

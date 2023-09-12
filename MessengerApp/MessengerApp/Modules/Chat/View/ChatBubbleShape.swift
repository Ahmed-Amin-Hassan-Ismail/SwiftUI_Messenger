//
//  ChatBubbleShape.swift
//  MessengerApp
//
//  Created by Ahmed Amin on 12/09/2023.
//

import SwiftUI


struct ChatBubbleShape: Shape {
    
    // MARK: - Properties
    
    private let isFromCurrentUser: Bool
    
    // MARK: - Init
    
    init(isFromCurrentUser: Bool) {
        
        self.isFromCurrentUser = isFromCurrentUser
    }
    
    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect,
                                byRoundingCorners: [
                                    .topLeft,
                                    .topRight,
                                    isFromCurrentUser ? .bottomLeft : .bottomRight
                                ],
                                cornerRadii: CGSize(width: 16, height: 16))
        
        return Path(path.cgPath)
    }
}

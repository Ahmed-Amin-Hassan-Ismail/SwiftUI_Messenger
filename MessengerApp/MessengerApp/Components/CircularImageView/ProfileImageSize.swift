//
//  ProfileImageSize.swift
//  MessengerApp
//
//  Created by Ahmed Amin on 12/09/2023.
//

import Foundation


enum ProfileImageSize {
    case xSmall
    case small
    case medium
    case large
    case xLarge
    
    
    var dimension: CGFloat {
        
        switch self {
            
        case .xSmall:
            return 32
        case .small:
            return 40
        case .medium:
            return 52
        case .large:
                return 64
        case .xLarge:
            return 100
        }
    }
}

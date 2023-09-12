//
//  SettingOptions.swift
//  MessengerApp
//
//  Created by Ahmed Amin on 12/09/2023.
//

import SwiftUI


enum SettingOptions: Int, CaseIterable, Identifiable {
    
    case darkMode
    case activeStatus
    case accessibility
    case privacy
    case notifications
    
    
    var title: String {
        switch self {
        case .darkMode:
            return "Dark Mode"
        case .activeStatus:
            return "Active Status"
        case .accessibility:
            return "Accessibility"
        case .privacy:
            return "Privacy"
        case .notifications:
            return "Notifications"
        }
    }
    
    var imageName: String {
        switch self {
        case .darkMode:
            return "moon.circle.fill"
        case .activeStatus:
            return "message.badge.circle.fill"
        case .accessibility:
            return "person.circle.fill"
        case .privacy:
            return "lock.circle.fill"
        case .notifications:
            return "bell.circle.fill"
        }
    }
    
    var imageBackgroundColor: Color {
        switch self {
        case .darkMode:
            return .black
        case .activeStatus:
            return Color(.systemGreen)
        case .accessibility:
            return .red
        case .privacy:
            return Color(.systemBlue)
        case .notifications:
            return Color(.systemPurple)
        }
    }
    
    
    var id: Int {
        
        self.rawValue
    }
}

//
//  Date + EXT.swift
//  MessengerApp
//
//  Created by Ahmed Amin on 18/09/2023.
//

import Foundation


extension Date {
 
    
    private var timeFormatter: DateFormatter {
        var formatter = DateFormatter()
        formatter.timeStyle = .short
        formatter.dateFormat = "HH:mm"
        
        return formatter
    }
    
    private var dayFormatter: DateFormatter {
        var formatter = DateFormatter()
        formatter.timeStyle = .medium
        formatter.dateFormat = "MM/dd/yy"
        
        return formatter
    }
    
    private func timeString() -> String {
        return timeFormatter.string(from: self)
    }
    
    private func dayString() -> String {
        return dayFormatter.string(from: self)
    }
    
    func timestampString() -> String {
        if Calendar.current.isDateInToday(self) {
            return timeString()
        } else if Calendar.current.isDateInYesterday(self) {
            return "chat_yesterday".localized
        } else {
            return dayString()
        }
    }
}

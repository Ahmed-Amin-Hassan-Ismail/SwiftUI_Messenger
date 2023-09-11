//
//  String + EXT.swift
//  MessengerApp
//
//  Created by Ahmed Amin on 11/09/2023.
//

import Foundation



extension String {
    
    var localized: Self {
        
        return NSLocalizedString(self, comment: self)
    }
}

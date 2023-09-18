//
//  NavigationRout.swift
//  MessengerApp
//
//  Created by Ahmed Amin on 18/09/2023.
//

import Foundation


enum NavigationRout: Hashable {
    
    case profileView(_ user: User?)
    case chatView(_ user: User?)
    
}

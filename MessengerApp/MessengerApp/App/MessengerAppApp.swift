//
//  MessengerAppApp.swift
//  MessengerApp
//
//  Created by Ahmed Amin on 11/09/2023.
//

import SwiftUI

@main
struct MessengerAppApp: App {
    
    // MARK: - Properties
    
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delefate
    
    
    var body: some Scene {
        WindowGroup {
            
            RootView()
        }
    }
}

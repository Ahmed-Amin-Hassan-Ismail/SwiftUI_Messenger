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
    
    @State private var shouldShowLoginScreen: Bool = false
    
    
    var body: some Scene {
        WindowGroup {
            ZStack {
                
                if shouldShowLoginScreen {
                    
                    LoginView()
                        .zIndex(0)
                    
                } else {
                    
                    SplashView(shouldShowLoginScreen: $shouldShowLoginScreen)
                        .transition(.move(edge: .leading))
                        .zIndex(1)
                    
                }
                
            }
        }
    }
}

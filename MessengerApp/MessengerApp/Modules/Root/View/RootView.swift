//
//  RootView.swift
//  MessengerApp
//
//  Created by Ahmed Amin on 17/09/2023.
//

import SwiftUI
import Combine


struct RootView: View {
    
    // MARK: - Properties
    
    @StateObject private var viewModel = RootViewModel()
    @State private var shouldShowLoginScreen: Bool = false
    
    // MARK: - Body
    
    var body: some View {
        
        ZStack {
            
            if shouldShowLoginScreen {
                
                if viewModel.isUserLoggedInBefore() {
                    
                    HomeView()
                        .zIndex(0)
                    
                } else {
                    
                    LoginView()
                        .zIndex(0)
                }
                
            } else {
                
                SplashView(shouldShowLoginScreen: $shouldShowLoginScreen)
                    .transition(.move(edge: .leading))
                    .zIndex(1)
                
            }
        }
    }
}

struct RootView_Previews: PreviewProvider {
    static var previews: some View {
        RootView()
    }
}

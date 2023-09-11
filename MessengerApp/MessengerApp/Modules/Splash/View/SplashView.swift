//
//  SplashView.swift
//  MessengerApp
//
//  Created by Ahmed Amin on 11/09/2023.
//

import SwiftUI

struct SplashView: View {
    
    // MARK: - Properties
    
    @Binding var shouldShowLoginScreen: Bool
    
    @State private var timeCounter: Int = 0
    @State private var timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    // MARK: - Body
    
    var body: some View {
        
        LottieAnimationView(lottieFile: "splash")
            .onReceive(timer) { _ in
                withAnimation(.easeInOut) {
                    timeCounter += 1
                    
                    if timeCounter >= 2 {
                        
                        shouldShowLoginScreen = true
                        
                    }
                }
            }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        SplashView(shouldShowLoginScreen: .constant(false))
    }
}

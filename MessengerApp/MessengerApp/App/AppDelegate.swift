//
//  AppDelegate.swift
//  MessengerApp
//
//  Created by Ahmed Amin on 12/09/2023.
//

import SwiftUI



class AppDelegate: NSObject, UIApplicationDelegate {
    
 
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        
        FirebaseManager.shared.setup()
        
        return true
    }
}

//
//  LottieAnimationView.swift
//  MessengerApp
//
//  Created by Ahmed Amin on 11/09/2023.
//

import SwiftUI
import Lottie

struct LottieAnimationView: UIViewRepresentable {
    
    // MARK: - Properties
    
    private let lottieFile: String
    private let animationView: AnimationView = AnimationView()
    
    // MARK: - Init
     
    init( lottieFile: String) {
        self.lottieFile = lottieFile
    }
    
    
    func makeUIView(context: Context) -> some UIView {
        
        let view = UIView(frame: .zero)
        
        animationView.animation = Animation.named(lottieFile)
        animationView.contentMode = .scaleAspectFit
        animationView.loopMode = .playOnce
        animationView.play()
        
        
        view.addSubview(animationView)
        
        animationView.translatesAutoresizingMaskIntoConstraints = false
        animationView.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        animationView.heightAnchor.constraint(equalTo: view.heightAnchor).isActive = true
        
        
        return view
    }
    
    func updateUIView(_ uiView: UIViewType, context: Context) {
        /// no implementation yet
    }
    
}

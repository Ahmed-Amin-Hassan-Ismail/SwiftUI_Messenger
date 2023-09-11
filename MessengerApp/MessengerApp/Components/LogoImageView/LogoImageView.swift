//
//  LogoImageView.swift
//  MessengerApp
//
//  Created by Ahmed Amin on 11/09/2023.
//

import SwiftUI

struct LogoImageView: View {
    
    // MARK: - Properties
    
    private let isLogoAppeared: Bool
    
    
    // MARK: - Init
    
    init(isLogoAppeared: Bool) {
        
        self.isLogoAppeared = isLogoAppeared
    }
    
    // MARK: - Body
    
    var body: some View {
        
        Image.logo
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(width: 150, height: 150)
            .padding(.top, 50)
            .padding(.vertical)
            .offset(y: isLogoAppeared ? 0 : -100)
            .opacity(isLogoAppeared ? 1 : 0)
            .animation(Animation.easeInOut(duration: 1.0),
                       value: isLogoAppeared)
    }
}

struct LogoImageView_Previews: PreviewProvider {
    static var previews: some View {
        LogoImageView(isLogoAppeared: true)
    }
}

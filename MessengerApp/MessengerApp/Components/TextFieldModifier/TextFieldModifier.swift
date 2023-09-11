//
//  TextFieldModifier.swift
//  MessengerApp
//
//  Created by Ahmed Amin on 11/09/2023.
//

import SwiftUI

struct TextFieldModifier: ViewModifier {
    
    func body(content: Content) -> some View {
        content
            .font(.subheadline)
            .fontWeight(.semibold)
            .padding(15)
            .background(Color(.systemGray6))
            .cornerRadius(10)
    }
}




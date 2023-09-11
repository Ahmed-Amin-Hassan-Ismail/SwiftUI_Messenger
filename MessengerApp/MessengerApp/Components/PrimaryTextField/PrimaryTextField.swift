//
//  PrimaryTextField.swift
//  MessengerApp
//
//  Created by Ahmed Amin on 11/09/2023.
//

import SwiftUI

struct PrimaryTextField: View {
    
    // MARK: - Properties
    
    
    @Binding var textFieldInput: String
    
    let title: String
    let isSecured: Bool
    
    
    // MARK: - Body
    
    var body: some View {
        
        ZStack {
            
            if isSecured {
                
                SecureField(title, text: $textFieldInput)
                    .modifier(TextFieldModifier())
                
            } else {
                
                TextField(title, text: $textFieldInput)
                    .modifier(TextFieldModifier())
            }
        }
    }
}

struct PrimaryTextField_Previews: PreviewProvider {
    static var previews: some View {
        PrimaryTextField(textFieldInput: .constant(""), title: "Enter Your Email", isSecured: false)
    }
}

//
//  SignUpView.swift
//  MessengerApp
//
//  Created by Ahmed Amin on 11/09/2023.
//

import SwiftUI

struct SignUpView: View {
    
    // MARK: - Properties
    
    @StateObject private var viewModel = SignUpViewModel()
    @Environment(\.dismiss) private var dismiss
    
    
    // MARK: - Body
    
    var body: some View {
        
        VStack {
            
            LogoImageView(isLogoAppeared: viewModel.isLogoAppeared)
            
            VStack(spacing: 15) {
                
                PrimaryTextField(textFieldInput: $viewModel.email,
                                 title: "login_enter_your_email".localized,
                                 isSecured: false)
                
                PrimaryTextField(textFieldInput: $viewModel.username,
                                 title: "sign_up_enter_user_name".localized,
                                 isSecured: false)
                
                PrimaryTextField(textFieldInput: $viewModel.password,
                                 title: "login_enter_your_password".localized,
                                 isSecured: true)
            }
            
            
            PrimaryButton(title: "login_sign_up_button_title".localized) {
                
                viewModel.didTapOnSignUp()
            }
            .padding(.top, 50)
            
            Spacer()
                        
            loginButton
        }
        .padding()
        .onAppear {
            
            viewModel.isLogoAppeared = true
        }
        
    }
}

// MARK: - SETUP View

extension SignUpView {
    
    
    private var loginButton: some View {
        HStack(spacing: 3) {
            Text("sign_up_already_have_an_account".localized)
            
            
            Button {
                
                dismiss()
                
            } label: {
                Text("sign_up_sign_in_button_title".localized)
                    .fontWeight(.bold)
                    .underline()
            }
        }
        .font(.footnote)
        .fontWeight(.semibold)
        .foregroundColor(.blue)
        .padding()
    }
    
}

struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView()
    }
}

//
//  LoginView.swift
//  MessengerApp
//
//  Created by Ahmed Amin on 11/09/2023.
//

import SwiftUI

struct LoginView: View {
    
    // MARK: - Properties
    
    @StateObject private var viewModel = LoginViewModel()
    
    
    // MARK: - Body
    
    var body: some View {
        
        NavigationStack {
            
            VStack {
                
                logoImageView
                
                emailTextField
                
                passwordTextField
                
                forgetButton
                
                loginButton
                
                dividerView
                
                facebookButton
                
                Spacer()
                
                signUpButton
                
            }
            .padding()
            .onAppear {
                viewModel.isLogoAppeared = true
            }
        }
        
    }
}

// MARK: - SETUP View

extension LoginView {
    
    private var logoImageView: some View {
        Image.logo
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(width: 150, height: 150)
            .padding(.top, 50)
            .padding(.vertical)
            .offset(y: viewModel.isLogoAppeared ? 0 : -100)
            .opacity(viewModel.isLogoAppeared ? 1 : 0)
            .animation(Animation.easeInOut(duration: 1.0),
                       value: viewModel.isLogoAppeared)
    }
    
    private var emailTextField: some View {
        
        TextField("login_enter_your_email".localized, text: $viewModel.email)
            .modifier(TextFieldModifier())
            .padding(.bottom, 10)
    }
    
    private var passwordTextField: some View {
        
        SecureField("login_enter_your_password".localized, text: $viewModel.password)
            .modifier(TextFieldModifier())
    }
    
    private var forgetButton: some View {
        
        HStack {
            
            Spacer()
            
            Button {
                
                viewModel.didTapOnForgetButton()
                
            } label: {
                
                Text("login_forget_password".localized)
                    .font(.footnote)
                    .fontWeight(.semibold)
                    .padding(.top)
            }
        }
    }
    
    private var loginButton: some View {
        
        Button {
            
            viewModel.didTapOnLoginButton()
            
        } label: {
            
            Text("login_login_button_title".localized)
                .font(.headline)
                .foregroundColor(.white)
                .padding()
                .frame(maxWidth: .infinity)
        }
        .buttonStyle(.borderedProminent)
        .buttonBorderShape(.roundedRectangle)
        .padding(.top, 10)
    }
    
    private var dividerView: some View {
        HStack {
            VStack { Divider() }
            
            Text("login_or_title".localized)
                .font(.footnote)
                .fontWeight(.semibold)
            
            VStack { Divider() }
        }
        .foregroundColor(.gray)
        .padding()
    }
    
    private var facebookButton: some View {
        
        Button {
            
            viewModel.didTapOnLoginWithFacebook()
            
        } label: {
            HStack {
                
                Image.facebook
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 30, height: 30)
                
                
                Text("login_continue_with_facebook".localized)
                    .font(.footnote)
                    .fontWeight(.semibold)
                    .foregroundColor(Color.blue)
            }
        }
    }
    
    private var signUpButton: some View {
        HStack(spacing: 3) {
            Text("login_do_not_have_account".localized)
            
            Button {
                
            } label: {
                Text("login_sign_up_button_title".localized)
                    .fontWeight(.bold)
            }
        }
        .font(.footnote)
        .fontWeight(.semibold)
        .foregroundColor(.blue)
        .padding()
    }
    
}


struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}

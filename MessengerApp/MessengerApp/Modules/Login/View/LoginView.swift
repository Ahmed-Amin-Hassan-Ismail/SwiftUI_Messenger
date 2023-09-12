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
                
                LogoImageView(isLogoAppeared: viewModel.isLogoAppeared)
                
                PrimaryTextField(textFieldInput: $viewModel.email,
                                 title: "login_enter_your_email".localized,
                                 isSecured: false)
                .padding(.bottom, 10)
                
                
                PrimaryTextField(textFieldInput: $viewModel.password,
                                 title: "login_enter_your_password".localized,
                                 isSecured: true)
                
                forgetButton
                
                
                PrimaryButton(title: "login_login_button_title".localized) {
                    
                    viewModel.didTapOnLoginButton()
                }
                .padding(.top, 10)
                
                dividerView
                
                facebookButton
                
                Spacer()
                
                signUpButton
                
            }
            .padding()
            .navigationDestination(isPresented: $viewModel.shouldShowHomeView, destination: {
                HomeView()
                    .navigationBarBackButtonHidden()
            })
            .onAppear {
                viewModel.isLogoAppeared = true
            }
        }
    }
}

// MARK: - SETUP View

extension LoginView {
    
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
                        
            NavigationLink {
                
                SignUpView()
                    .navigationBarBackButtonHidden()
                
            } label: {
                
                Text("login_sign_up_button_title".localized)
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


struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}

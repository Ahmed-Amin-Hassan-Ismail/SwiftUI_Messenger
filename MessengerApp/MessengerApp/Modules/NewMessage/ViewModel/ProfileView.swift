//
//  ProfileView.swift
//  MessengerApp
//
//  Created by Ahmed Amin on 11/09/2023.
//

import SwiftUI

struct ProfileView: View {
    
    // MARK: - Properties
    
    @StateObject private var viewModel = ProfileViewModel()
    
    // MARK: - Body
    
    var body: some View {
        
        VStack {
            
            imageProfileView
            
            settingSection
            
        }
        .padding(.top, 60)
    }
}

// MARK: - SETUP View

extension ProfileView {
    
    private var imageProfileView: some View {
        
        VStack {
            Image.userProfile
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 100, height: 100)
                .clipShape(Circle())
                .overlay(
                    ZStack {
                        Circle()
                            .fill(Color.white)
                            .frame(width: 25, height: 25)
                        
                        Image(systemName: "camera.fill")
                            .resizable()
                            .frame(width: 20, height: 20)
                            
                    }
                    ,alignment: .bottomTrailing)
            
            Text("Ahmed Amin")
                .font(.title2)
                .fontWeight(.semibold)
        }
    }
    
    
    private var settingSection: some View {
        List {
            
            Section {
                
                ForEach(viewModel.settingsOptions) { option in
                    SettingRowView(option: option)
                }                
            }
            
            Section {
                
                logoutButton
                
                deleteAccountButton
            }
            .foregroundColor(.red)
        }
    }
    
    private var logoutButton: some View {
        
        Button {
            
            viewModel.didTapOnLogout()
            
        } label: {
            Text("Log out")
        }
    }
    
    
    private var deleteAccountButton: some View {
        
        
        Button {
            
            viewModel.didTapOnDeleteAccount()
            
        } label: {
            Text("Delete Account")
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}

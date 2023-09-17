//
//  ProfileView.swift
//  MessengerApp
//
//  Created by Ahmed Amin on 11/09/2023.
//

import SwiftUI
import PhotosUI


struct ProfileView: View {
    
    // MARK: - Properties
    
    @StateObject private var viewModel: ProfileViewModel
    
    init(user: UserModel) {
        
        _viewModel = StateObject(wrappedValue: ProfileViewModel(user: user))
    }
    
    // MARK: - Body
    
    var body: some View {
        
        VStack {
            
            imageProfileView
            
            settingSection
            
        }
        .padding(.top, 50)
    }
}

// MARK: - SETUP View

extension ProfileView {
    
    private var imageProfileView: some View {
        
        VStack {
            
            PhotosPicker(selection: $viewModel.selectedPhoto) {
                
                if let imagePicker = viewModel.selectedProfileImage {
                    setProfileImage(image: imagePicker)
                } else {
                    CircularImageView(user: viewModel.user, imageSize: .xLarge)
                        .overlay(
                            ZStack {
                                Circle()
                                    .fill(Color.white)
                                    .frame(width: 25, height: 25)
                                
                                Image(systemName: "camera.fill")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 18, height: 18)
                                    .foregroundColor(.black)
                            }
                            ,alignment: .bottomTrailing)
                }
            }
            
            Text(viewModel.user?.fullname ?? "")
                .font(.title2)
                .fontWeight(.semibold)
        }
    }
    
    private func setProfileImage(image: Image) -> some View {
        
        image
            .resizable()
            .aspectRatio(contentMode: .fill)
            .frame(width: 100, height: 100)
            .foregroundColor(.gray)
            .clipShape(Circle())
            .overlay(
                ZStack {
                    Circle()
                        .fill(Color.white)
                        .frame(width: 25, height: 25)
                    
                    Image(systemName: "camera.fill")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 18, height: 18)
                        .foregroundColor(.black)
                }
                ,alignment: .bottomTrailing)
        
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
        ProfileView(user: dev.user)
    }
}

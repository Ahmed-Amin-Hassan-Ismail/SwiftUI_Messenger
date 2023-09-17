//
//  ProfileViewModel.swift
//  MessengerApp
//
//  Created by Ahmed Amin on 12/09/2023.
//

import SwiftUI
import PhotosUI
import Combine


final class ProfileViewModel: ObservableObject {
    
    // MARK: - Properties
    
    @Published var settingsOptions = SettingOptions.allCases
    @Published var user: UserModel?
    @Published var selectedPhoto: PhotosPickerItem?
    @Published var selectedProfileImage: Image?
    
    private lazy var service = ProfileService()
    private var cancellables = Set<AnyCancellable>()
    
    
    // MARK: - Methods
    
    init(user: UserModel?) {
        
        self.user = user
        addPhotoSubscriber()
    }
    
    private func addPhotoSubscriber() {
        $selectedPhoto
            .sink { [weak self] item in
                guard let self = self else { return }
                Task {
                    try await self.loadUserImage(item: item)
                }
            }
            .store(in: &cancellables)
    }
  
    @MainActor
    private func loadUserImage(item: PhotosPickerItem?) async throws {
        guard let item = item else { return }
        guard let imageData = try await item.loadTransferable(type: Data.self) else { return }
        guard let uiImage = UIImage(data: imageData) else { return }
        
        self.selectedProfileImage = Image(uiImage: uiImage)
    }
    
    func didTapOnLogout() {
        
        service.logout()
    }
    
    func didTapOnDeleteAccount() {
        /// not implemented yet
    }
}

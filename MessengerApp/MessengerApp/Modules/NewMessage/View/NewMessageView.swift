//
//  NewMessageView.swift
//  MessengerApp
//
//  Created by Ahmed Amin on 11/09/2023.
//

import SwiftUI

struct NewMessageView: View {
    
    // MARK: - Properties
    
    @Binding var selectedUser: User?
    @StateObject private var viewModel = NewMessageViewModel()
    @Environment(\.dismiss) private var dismiss
    
    // MARK: - Body
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 0) {
                PrimaryTextField(textFieldInput: $viewModel.searchText, title: "new_message_to_search".localized, isSecured: false)
                
                List {
                    Section {
                        ForEach(viewModel.allUsers ?? []) { user in
                            setNewUser(user: user)
                        }
                    } header: {
                        Text("new_message_contacts".localized)
                            .font(.subheadline)
                            .foregroundColor(.gray)
                            .padding(.bottom, 10)
                    }
                }
                .listStyle(.plain)
            }
            .navigationTitle("new_message_title".localized)
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) { cancelButton }
            }
        }
    }
}

// MARK: - SETUP View

extension NewMessageView {
    
    private func setNewUser(user: User) -> some View {
        HStack {
            CircularImageView(user: user, imageSize: .large)
            
            Text(user.fullname ?? "")
                .font(.headline)
                .fontWeight(.semibold)
            
        }
        .onTapGesture {
            selectedUser = user
            dismiss()
        }
    }
    
    private var cancelButton: some View {
        Button {
            
            dismiss()
            
        } label: {
            
            Text("Cancel")
                .font(.headline)
                .foregroundColor(.black)
        }
        
    }
}

struct NewMessageView_Previews: PreviewProvider {
    static var previews: some View {
        NewMessageView(selectedUser: .constant(dev.user))
    }
}

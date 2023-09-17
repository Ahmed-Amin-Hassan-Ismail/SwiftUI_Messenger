//
//  HomeView.swift
//  MessengerApp
//
//  Created by Ahmed Amin on 11/09/2023.
//

import SwiftUI

struct HomeView: View {
    
    // MARK: - Properties
    
    @StateObject private var viewModel = HomeViewModel()
    
    
    // MARK: - Body
    
    var body: some View {
    
        NavigationStack {
            
            VStack {
                ActiveNowView()
                    .padding(.top, 20)
                
                ChatRowView()
                    .padding(.horizontal)
            }
            .onChange(of: viewModel.selectedUser, perform: { newValue in
                viewModel.showChatView = (newValue != nil)
            })
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) { profileView }
                ToolbarItem(placement: .navigationBarTrailing) { newMessageView }
            }
            .navigationDestination(for: User.self, destination: { user in
                ProfileView(user: user)
            })
            .navigationDestination(isPresented: $viewModel.showChatView, destination: {
                ChatView(user: viewModel.selectedUser)
            })
            .fullScreenCover(isPresented: $viewModel.showNewMessageView, content: { NewMessageView(selectedUser: $viewModel.selectedUser)
            })
        }
    }
}


// MARK: - SETUP View

extension HomeView {
    
    private var profileView: some View {
        HStack {
            NavigationLink(value: viewModel.user) {
                
                CircularImageView(user: viewModel.user, imageSize: .small)
            }
            
            Text("home_chat_title".localized)
                .font(.title)
                .fontWeight(.bold)
        }
    }
    
    private var newMessageView: some View {
        
        Button {
            
            viewModel.showNewMessageView.toggle()
            
        } label: {
            Image(systemName: "square.and.pencil.circle.fill")
                .resizable()
                .frame(width: 35, height: 35)
                .foregroundStyle(.black, Color(.systemGray5))
            
        }

    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}

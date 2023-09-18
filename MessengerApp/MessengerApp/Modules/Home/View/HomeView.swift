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
                if viewModel.recentMessages.isEmpty {
                    
                    LottieAnimationView(lottieFile: "emptyMessage")
                    
                } else {
                    if !(viewModel.allUsers?.isEmpty ?? true) {
                        ActiveNowView(onlineUsers: viewModel.allUsers)
                            .padding(.top, 20)
                    }
                    
                    ChatRowView(recentMessages: viewModel.recentMessages)
                }
            }
            .onChange(of: viewModel.selectedUser, perform: { newValue in
                viewModel.showChatView = (newValue != nil)
            })
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) { profileView }
                ToolbarItem(placement: .navigationBarTrailing) { newMessageView }
            }
            .navigationDestination(for: Message.self) { message in
                ChatView(user: message.user)
            }
            .navigationDestination(for: NavigationRout.self, destination: { rout in
                switch rout {
                case .profileView(let user):
                    ProfileView(user: user)
                case .chatView(let user):
                    ChatView(user: user)
                }
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
            NavigationLink(value: NavigationRout.profileView(viewModel.user)) {
                
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
            viewModel.selectedUser = nil
            
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

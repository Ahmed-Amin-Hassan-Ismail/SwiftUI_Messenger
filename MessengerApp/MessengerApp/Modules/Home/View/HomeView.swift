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
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) { profileView }
                ToolbarItem(placement: .navigationBarTrailing) { newMessageView }
            }
            .fullScreenCover(isPresented: $viewModel.showNewMessageView, content: { NewMessageView() })
        }
    }
}


// MARK: - SETUP View

extension HomeView {
    
    private var profileView: some View {
        HStack {
            Image.userProfile
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 40, height: 40)
                .clipShape(Circle())
                .onTapGesture {
                    
                    viewModel.showProfileView.toggle()
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

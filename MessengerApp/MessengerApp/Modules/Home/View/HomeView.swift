//
//  HomeView.swift
//  MessengerApp
//
//  Created by Ahmed Amin on 11/09/2023.
//

import SwiftUI

struct HomeView: View {
    
    // MARK: - Properties
    
    
    // MARK: - Body
    
    var body: some View {
    
        NavigationStack {
            
            ScrollView {
               ActiveNowView()
                    .padding(.top, 20)
                
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) { profileView }
                ToolbarItem(placement: .navigationBarTrailing) { newChatView }
            }
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
            
            
            Text("Chats")
                .font(.title)
                .fontWeight(.bold)
        }
    }
    
    private var newChatView: some View {
        
        Button {
            
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

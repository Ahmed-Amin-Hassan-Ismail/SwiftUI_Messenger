//
//  ActiveNowView.swift
//  MessengerApp
//
//  Created by Ahmed Amin on 11/09/2023.
//

import SwiftUI

struct ActiveNowView: View {
    
    // MARK: - Properties
    
    private let onlineUsers: [User]?
    
    // MARK: - Init
    init(onlineUsers: [User]?) {
        
        self.onlineUsers = onlineUsers
    }
    
    
    // MARK: - Body
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            LazyHStack(spacing: 20) {
                ForEach(onlineUsers ?? []) { user in
                    NavigationLink(value: NavigationRout.chatView(user)) {
                        setupActiveView(withUser: user)
                    }
                }
            }
            .padding()
        }
        .frame(height: 106)
    }
}

// MARK: - SETUP View

extension ActiveNowView {
    
    private func setupActiveView(withUser user: User) -> some View {
        VStack {
            CircularImageView(user: user, imageSize: .large)
                .overlay(
                    ZStack {
                        Circle()
                            .fill(Color.white)
                            .frame(width: 18, height: 18)
                        Circle()
                            .fill(Color.green)
                            .frame(width: 12, height: 12)
                    }
                    ,alignment: .bottomTrailing)
            
            
            Text(user.firstName)
                .font(.subheadline)
                .foregroundColor(.gray)
        }
    }
}

struct ActiveNowView_Previews: PreviewProvider {
    static var previews: some View {
        ActiveNowView(onlineUsers: [dev.user, dev.user])
    }
}

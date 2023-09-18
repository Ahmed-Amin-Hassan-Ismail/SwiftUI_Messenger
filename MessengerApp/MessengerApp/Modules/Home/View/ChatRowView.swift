//
//  ChatRowView.swift
//  MessengerApp
//
//  Created by Ahmed Amin on 11/09/2023.
//

import SwiftUI

struct ChatRowView: View {
    
    // MARK: - Properties
    
    private let recentMessages: [Message]
    private let rowInset: EdgeInsets = EdgeInsets(top: 15, leading: 0, bottom: 0, trailing: 0)
    
    
    // MARK: - Init
    
    init(recentMessages: [Message]) {
        self.recentMessages = recentMessages
    }
    
    
    
    // MARK: - Body
    
    var body: some View {
        
        List {
            ForEach(recentMessages) { message in
                HStack(alignment: .top, spacing: 12) {
                    
                    setupLeftView(withMessage: message)
                    
                    setupMiddleView(withMessage: message)
                    
                    Spacer()
                    
                    setupRightView(withMessage: message)
                    
                }
                .listRowInsets(rowInset)
            }
        }
        .scrollIndicators(.hidden)
        .listStyle(.plain)
        
        
    }
}

// MARK: - SETUP View

extension ChatRowView {
    
    private func setupLeftView(withMessage message: Message) -> some View {
        CircularImageView(user: message.user, imageSize: .large)
    }
    
    private func setupMiddleView(withMessage message: Message) -> some View {
        VStack(alignment: .leading, spacing: 4) {
            Text(message.user?.fullname ?? "")
                .fontWeight(.bold)
            
            Text(message.textMessage ?? "")
                .foregroundColor(.gray)
                .lineLimit(2)
        }
        .font(.subheadline)
    }
    
    private func setupRightView(withMessage: Message) -> some View {
        HStack {
            Text("Yesterday")
            
            Image(systemName: "chevron.right")
            
        }
        .font(.subheadline)
        .foregroundColor(.gray)
    }
    
}

struct ChatRowView_Previews: PreviewProvider {
    static var previews: some View {
        ChatRowView(recentMessages: [])
    }
}

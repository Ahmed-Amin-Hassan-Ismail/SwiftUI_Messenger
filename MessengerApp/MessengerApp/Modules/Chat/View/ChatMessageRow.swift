//
//  ChatMessageRow.swift
//  MessengerApp
//
//  Created by Ahmed Amin on 12/09/2023.
//

import SwiftUI

struct ChatMessageRow: View {
    
    // MARK: - Properties
    
    private let message: Message
    
    // MARK: - Init
    
    init(message: Message) {
        
        self.message = message
    }
    
    // MARK: - Body
    
    var body: some View {
        
        HStack {
            
            if message.isFromCurrentUser {
                Spacer()
            }

            CircularImageView(user: message.user, imageSize: .xSmall)
                .offset(y: 30)
                .opacity(message.isFromCurrentUser ? 0 : 1.0)
            
            Text(message.textMessage ?? "")
                .font(.subheadline)
                .foregroundColor(message.isFromCurrentUser ? .white : .black)
                .padding(12)
                .background(Color(message.isFromCurrentUser ? .systemBlue : .systemGray5))
                .clipShape(ChatBubbleShape(isFromCurrentUser: message.isFromCurrentUser))
                .frame(maxWidth: UIScreen.main.bounds.width / (message.isFromCurrentUser ? 1.5 :  1.75), alignment: (message.isFromCurrentUser ? .trailing : .leading))
            
            if !message.isFromCurrentUser {
                Spacer()
            }
            
        }
        .padding(.horizontal, 8)
    }
}

struct ChatMessageRow_Previews: PreviewProvider {
    static var previews: some View {
        ChatMessageRow(message: Message())
    }
}

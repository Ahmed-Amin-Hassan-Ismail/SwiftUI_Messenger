//
//  ChatMessageRow.swift
//  MessengerApp
//
//  Created by Ahmed Amin on 12/09/2023.
//

import SwiftUI

struct ChatMessageRow: View {
    
    // MARK: - Properties
    
    private let isFromCurrentUser: Bool
    
    // MARK: - Init
    
    init(isFromCurrentUser: Bool) {
        
        self.isFromCurrentUser = isFromCurrentUser
    }
    
    // MARK: - Body
    
    var body: some View {
        
        HStack {
            
            if isFromCurrentUser {
                Spacer()
            }

            CircularImageView(user: DeveloperPreview.instance.user, imageSize: .xSmall)
                .offset(y: 30)
                .opacity(isFromCurrentUser ? 0 : 1.0)
            
            Text("My name is ahmed amin, i am iOS Developer")
                .font(.subheadline)
                .foregroundColor(isFromCurrentUser ? .white : .black)
                .padding(12)
                .background(Color(isFromCurrentUser ? .systemBlue : .systemGray5))
                .clipShape(ChatBubbleShape(isFromCurrentUser: isFromCurrentUser))
                .frame(maxWidth: UIScreen.main.bounds.width / (isFromCurrentUser ? 1.5 :  1.75), alignment: (isFromCurrentUser ? .trailing : .leading))
            
            if !isFromCurrentUser {
                Spacer()
            }
            
        }
        .padding(.horizontal, 8)
    }
}

struct ChatMessageRow_Previews: PreviewProvider {
    static var previews: some View {
        ChatMessageRow(isFromCurrentUser: false)
    }
}

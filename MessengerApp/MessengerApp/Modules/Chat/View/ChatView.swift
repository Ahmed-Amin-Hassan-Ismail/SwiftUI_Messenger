//
//  ChatView.swift
//  MessengerApp
//
//  Created by Ahmed Amin on 12/09/2023.
//

import SwiftUI

struct ChatView: View {
    
    // MARK: - Properties
    
    @StateObject private var viewModel = ChatViewModel()
    
    
    // MARK: - Body
    
    var body: some View {
        VStack {
            
            ScrollView {
                VStack(spacing: 10) {
                    
                    headerView
                    
                    ForEach(0...10, id: \.self) { _ in
                        ChatMessageRow(isFromCurrentUser: Bool.random())
                    }
                }
            }
            
            sendMessageTextFieldView
            
        }
        .navigationTitle("Ahmed Amin")
        .navigationBarTitleDisplayMode(.inline)
    }
}

// MARK: - SETUP View

extension ChatView {
    
    private var headerView: some View {
        
        VStack {
            CircularImageView(user: DeveloperPreview.instance.user, imageSize: .xLarge)
            
            Text("Ahmed Amin")
                .font(.title3)
                .fontWeight(.semibold)
            
            Text("chat_messenger_title".localized)
                .font(.footnote)
                .foregroundColor(.gray)
        }
    }
    
    private var sendMessageTextFieldView: some View {
        
        ZStack(alignment: .trailing) {
            TextField("chat_meesege_text".localized, text: $viewModel.messageText, axis: .vertical)
                .font(.subheadline)
                .padding(12)
                .padding(.trailing, 48)
                .background(Color(.systemGray6))
            
            Button {
                viewModel.didTapOnSend()
            } label: {
                Text("chat_send_title_button".localized)
                    .font(.headline)
                    .fontWeight(.semibold)
            }
            .padding(.horizontal)
        }
        .clipShape(Capsule())
        .padding(.horizontal)
    }
}

struct ChatView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            ChatView()
        }
    }
}

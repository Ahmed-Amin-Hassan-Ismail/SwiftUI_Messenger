//
//  ChatRowView.swift
//  MessengerApp
//
//  Created by Ahmed Amin on 11/09/2023.
//

import SwiftUI

struct ChatRowView: View {
    
    // MARK: - Properties
    
    private let rowInset: EdgeInsets = EdgeInsets(top: 15, leading: 0, bottom: 0, trailing: 0)
    
    // MARK: - Body
    
    var body: some View {
     
        List {
            ForEach(0...10, id:\.self) { _ in
                HStack(alignment: .top, spacing: 12) {
                    
                    leftView
                    
                    middleView
                    
                    Spacer()
                    
                    rightView
                    
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
    
    private var leftView: some View {
        CircularImageView(user: DeveloperPreview.instance.user, imageSize: .large)
    }
    
    private var middleView: some View {
        VStack(alignment: .leading, spacing: 4) {
            Text("Ahmed Amin")
                .fontWeight(.bold)
                
            Text("How are you?")
                .foregroundColor(.gray)
                .lineLimit(2)
        }
        .font(.subheadline)
    }
    
    private var rightView: some View {
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
        ChatRowView()
    }
}

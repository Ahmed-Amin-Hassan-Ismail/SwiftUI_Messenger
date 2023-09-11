//
//  ActiveNowView.swift
//  MessengerApp
//
//  Created by Ahmed Amin on 11/09/2023.
//

import SwiftUI

struct ActiveNowView: View {
    
    
    // MARK: - Body
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            LazyHStack(spacing: 20) {
                ForEach(0...10, id: \.self) { _ in
                   activeView
                }
            }
            .padding()
        }
        .frame(height: 106)
    }
}

// MARK: - SETUP View

extension ActiveNowView {
    
    private var activeView: some View {
        
        VStack {
            Image.userProfile
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 65, height: 65)
                .clipShape(Circle())
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
            
            
            Text("Ahmed Amin")
                .font(.subheadline)
                .foregroundColor(.gray)
        }
    }
}

struct ActiveNowView_Previews: PreviewProvider {
    static var previews: some View {
        ActiveNowView()
    }
}

//
//  CircularImageView.swift
//  MessengerApp
//
//  Created by Ahmed Amin on 12/09/2023.
//

import SwiftUI

struct CircularImageView: View {
    
    // MARK: - Properties
    
    private let user: User?
    private let imageSize: ProfileImageSize
    
    // MARK: - Init
    
    init(user: User?, imageSize: ProfileImageSize) {
        self.user = user
        self.imageSize = imageSize
    }
    
    // MARK: - Body
    
    var body: some View {
        
        AsyncImage(url: user?.imageUrl) { image in
            image
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: imageSize.dimension, height: imageSize.dimension)
                .clipShape(Circle())
        } placeholder: {
            Image.profilePlaceholder
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: imageSize.dimension, height: imageSize.dimension)
                .foregroundColor(.gray)
                .clipShape(Circle())
        }

        
    }
}

struct ProfileImageView_Previews: PreviewProvider {
    static var previews: some View {
        CircularImageView(user: dev.user, imageSize: .xLarge)
    }
}


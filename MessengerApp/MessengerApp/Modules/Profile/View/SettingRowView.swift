//
//  SettingRowView.swift
//  MessengerApp
//
//  Created by Ahmed Amin on 12/09/2023.
//

import SwiftUI

struct SettingRowView: View {
    
    // MARK: - Properties
    
    let option: SettingOptions
    
    // MARK: - Body
    
    var body: some View {
        
        HStack {
            
            Image(systemName: option.imageName)
                .resizable()
                .frame(width: 24, height: 24)
                .foregroundColor(option.imageBackgroundColor)
            
            Text(option.title)
                .font(.subheadline)
                .fontWeight(.semibold)
        }
    }
}

struct SettingRowView_Previews: PreviewProvider {
    static var previews: some View {
        SettingRowView(option: .darkMode)
    }
}

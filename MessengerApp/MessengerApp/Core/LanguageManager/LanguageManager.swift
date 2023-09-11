//
//  LanguageManager.swift
//  MessengerApp
//
//  Created by Ahmed Amin on 11/09/2023.
//

import Foundation



enum Language: String {
    
    case en = "en"
    case ar = "ar"
}

final class LanguageManager {
    
    // MARK: - Singelton
    
    static var shared: LanguageManager {
        
        return LanguageManager()
    }
    
    private init() { }
    
    
    // MARK: - Variables
    
    var currentLanguage: Language? {
        
        Language(rawValue: Locale.autoupdatingCurrent.language.languageCode?.identifier ?? "en")
    }
}

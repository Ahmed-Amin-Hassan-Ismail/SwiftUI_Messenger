//
//  ErrorHandling.swift
//  MessengerApp
//
//  Created by Ahmed Amin on 12/09/2023.
//

import Foundation


enum ErrorHandling: LocalizedError {
    
    case badURLResponse(url: URL)
    case unknown
    case catchError
    
    var errorDescription: String? {
        switch self {
        case .badURLResponse(let url):
            return "[🔥] Bad response from URL: \(url)"
            
        case .unknown:
            return "[⚠️] Unknown error occured"
            
        case .catchError:
            return "[💥] Failed with error \(localizedDescription)"
        }
    }
    
    
    
}

//
//  SignUpAlert.swift
//  GameStream
//
//  Created by user239477 on 5/28/23.
//

import Foundation

enum SignUpAlert: Identifiable {
    
    case incorrectEmailFormat
    case incorrectPasswordFormat
    case passwordsDoNotMatch
    
    var id: Int {
        
        switch self {
            
        case .incorrectEmailFormat:
            return 1
            
        case .incorrectPasswordFormat:
            return 2
            
        case .passwordsDoNotMatch:
            return 3
        }
    }
}

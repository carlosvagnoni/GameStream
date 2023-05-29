//
//  EditProfileAlert.swift
//  GameStream
//
//  Created by user239477 on 5/28/23.
//

import Foundation

enum EditProfileAlert: Identifiable {
    
    case incorrectEmailFormat
    case incorrectPasswordFormat
    case credentialsSameAsCurrent
    case emptyUserName
    
    var id: Int {
        switch self {
            
        case .incorrectEmailFormat:
            return 1
            
        case .incorrectPasswordFormat:
            return 2
            
        case .credentialsSameAsCurrent:
            return 3
            
        case .emptyUserName:
            return 4
        }
    }
}

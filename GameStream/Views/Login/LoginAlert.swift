//
//  LoginAlert.swift
//  GameStream
//
//  Created by user239477 on 5/28/23.
//

import Foundation

enum LoginAlert: Identifiable {
    case incorrectCredentials

    var id: Int {
        
        switch self {
            
        case .incorrectCredentials:
            return 1
        }
    }
}

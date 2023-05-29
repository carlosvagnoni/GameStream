//
//  GameAlert.swift
//  GameStream
//
//  Created by user239477 on 5/28/23.
//

import Foundation

enum GameAlert: Identifiable {
    
    case gameNotFound
    case searchTextEmpty

    var id: Int {
        
        switch self {
            
        case .gameNotFound:
            return 1
            
        case .searchTextEmpty:
            return 2
        }
    }
}

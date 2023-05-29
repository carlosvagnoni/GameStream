//
//  StringExtensions.swift
//  GameStream
//
//  Created by user239477 on 5/28/23.
//

import Foundation

extension String {
    
    func truncate(_ length: Int) -> String {
        
        guard self.count > length else { return self }
        return prefix(length) + "..."
        
    }
}

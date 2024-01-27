//
//  Optional+Extension.swift
//  Zwiggy
//
//  Created by Ajaya Mati on 27/01/24.
//

import Foundation

extension Optional {
    func nilCoalascing(_ defaultValue: Wrapped) -> Wrapped {
        if let value = self {
            return value
        }
        
        return defaultValue
    }
}

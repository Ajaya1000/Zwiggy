//
//  Item.swift
//  Zwiggy
//
//  Created by Ajaya Mati on 24/01/24.
//

import Foundation
import SwiftData

@Model
final class Item {
    var timestamp: Date
    
    init(timestamp: Date) {
        self.timestamp = timestamp
    }
}

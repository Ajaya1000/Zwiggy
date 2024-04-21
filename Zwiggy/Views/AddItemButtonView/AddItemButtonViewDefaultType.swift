//
//  AddItemButtonViewDefaultType.swift
//  Zwiggy
//
//  Created by Ajaya Mati on 20/04/24.
//

import Foundation

enum AddItemButtonViewDefaultType {
    case add
    case plus
}

extension AddItemButtonViewDefaultType {
    var value: String {
        switch self {
        case .add:
            "Add"
        case .plus:
            "+"
        }
    }
}

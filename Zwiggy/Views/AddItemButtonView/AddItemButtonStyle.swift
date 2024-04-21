//
//  AddItemButtonStyle.swift
//  Zwiggy
//
//  Created by Ajaya Mati on 20/04/24.
//

import SwiftUI

enum AddItemButtonStyle {
    case primary
    case secondary
}

extension AddItemButtonStyle {
    var textColor: Color {
        switch self {
        case .primary:
                .green
        case .secondary:
                .white
        }
    }
    
    var backgroundColor: Color {
        switch self {
        case .primary:
                .white
        case .secondary:
                .green
        }
    }
    
    var font: Font {
        switch self {
        case .primary:
                .system(size: 14.0, weight: .bold)
        case .secondary:
                .system(size: 14.0, weight: .bold)
        }
    }
}

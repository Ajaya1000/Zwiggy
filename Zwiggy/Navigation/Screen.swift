//
//  Screen.swift
//  Zwiggy
//
//  Created by Ajaya Mati on 06/02/24.
//

import SwiftUI

enum Screen: Hashable {
    case cart
    case categoryDetail(item: CategoryItem)
}

extension Screen {
    @ViewBuilder func BuildScreen() -> some View {
        switch self {
        case .cart:
            CartView()
        case .categoryDetail(let item):
            CategoryDetailView(data: item)
        }
    }
}

extension Screen {
    var shouldShowCart: Bool {
        switch self {
        case .categoryDetail(_):
            true
        default:
            false
        }
    }
}

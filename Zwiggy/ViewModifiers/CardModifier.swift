//
//  Card.swift
//  Zwiggy
//
//  Created by Ajaya Mati on 25/01/24.
//

import SwiftUI

struct CardModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .padding(12)
            .clipShape(
                RoundedRectangle(cornerRadius: 12.0)
            )
    }
    
}

extension View {
    func card() -> some View {
        modifier(CardModifier())
    }
}

#Preview {
    HStack {
        Text("Hi")
        Text("Hi")
        Text("Hi")
    }
    .card()
    
}

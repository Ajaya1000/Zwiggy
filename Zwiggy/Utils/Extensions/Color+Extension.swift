//
//  Color+Extension.swift
//  Zwiggy
//
//  Created by Ajaya Mati on 26/01/24.
//

import SwiftUI

extension Color {
    init(r: CGFloat, g: CGFloat, b: CGFloat, a: CGFloat = 1) {
        self.init(uiColor: .init(red: r/255.0, green: g/255.0, blue: b/255.0, alpha: a))
    }
}

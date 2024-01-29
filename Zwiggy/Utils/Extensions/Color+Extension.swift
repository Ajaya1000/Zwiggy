//
//  Color+Extension.swift
//  Zwiggy
//
//  Created by Ajaya Mati on 26/01/24.
//

import SwiftUI

extension Color {
    init(_ r: CGFloat, _ g: CGFloat,_ b: CGFloat, a: CGFloat = 1) {
        self.init(uiColor: .init(r, g, b, a: a))
    }
    
    init?(hex: String) {
        if let uiColor = UIColor(hex: hex) {
            self.init(uiColor: uiColor)
        }
        
        return nil
    }
}

extension Color {
    static var zGray: Color = .init(227, 227, 227)
    static var zGray1: Color = .init(245, 245, 245)
}

extension UIColor {
    convenience init(_ r: CGFloat, _ g: CGFloat, _ b: CGFloat, a: CGFloat = 1) {
        self.init(red: r/255.0, green: g/255.0, blue: b/255.0, alpha: a)
    }
    
    convenience init?(hex: String) {
        var hexSanitized = hex.trimmingCharacters(in: .whitespacesAndNewlines)
        hexSanitized = hexSanitized.replacingOccurrences(of: "#", with: "")

        var rgb: UInt64 = 0

        Scanner(string: hexSanitized).scanHexInt64(&rgb)

        var red: CGFloat = 0.0
        var green: CGFloat = 0.0
        var blue: CGFloat = 0.0
        var alpha: CGFloat = 1.0  // Default alpha value is 1.0 (fully opaque)

        if hexSanitized.count == 6 {
            red = CGFloat((rgb & 0xFF0000) >> 16) / 255.0
            green = CGFloat((rgb & 0x00FF00) >> 8) / 255.0
            blue = CGFloat(rgb & 0x0000FF) / 255.0
        } else if hexSanitized.count == 8 {
            red = CGFloat((rgb & 0xFF000000) >> 24) / 255.0
            green = CGFloat((rgb & 0x00FF0000) >> 16) / 255.0
            blue = CGFloat((rgb & 0x0000FF00) >> 8) / 255.0
            alpha = CGFloat(rgb & 0x000000FF) / 255.0
        } else {
            return nil  // Invalid length for a hex color code
        }

        self.init(red: red, green: green, blue: blue, alpha: alpha)
    }
}


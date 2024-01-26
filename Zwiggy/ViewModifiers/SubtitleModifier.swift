//
//  SubtitleModifier.swift
//  Zwiggy
//
//  Created by Ajaya Mati on 24/01/24.
//

import SwiftUI

//struct SubtitleModifier: ViewModifier {
//    func body(content: Content) -> some View {
//        content
//            .font()
//    }
//}
//
//extension View {
//    func subtitleText() -> some View {
//        modifier(SubtitleModifier())
//    }
//}

extension Font {
    static var zHeadline: Font = .system(size: 18.0, weight: .heavy)
    static var zsubTitle: Font = .system(size: 14.0, weight: .light)
    static var zDescription: Font = .system(size: 14.0, weight: .regular)
    static var zDescriptionBold: Font = .system(size: 14.0, weight: .bold)
}

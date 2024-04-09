//
//  SectionLabelStyle.swift
//  Zwiggy
//
//  Created by Ajaya Mati on 08/04/24.
//

import Foundation

struct SectionLabelStyle: Decodable {
    var text: String?
    var foregroundColor: SectionColor.Text?
    var backgroundColor: SectionColor.Background?
    var fontSize: Double?
    var fontWeight: FontWeight?
}

extension SectionLabelStyle {
    enum FontWeight: String, Decodable {
        case regular
        case bold
    }
}

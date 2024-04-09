//
//  SectionColor.swift
//  Zwiggy
//
//  Created by Ajaya Mati on 08/04/24.
//

import Foundation

enum SectionColor {
    enum Text: String, Decodable {
        case primary
        case secondary
    }
    
    enum Background: Decodable {
        case primary
        case secondary
    }
}

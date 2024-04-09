//
//  TemplateSection.swift
//  Zwiggy
//
//  Created by Ajaya Mati on 08/04/24.
//

import Foundation

struct TemplateSection: Decodable {
    var title: (any SectionTitle)?
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let decoder = try container.superDecoder(forKey: .title)
        
        self.title = try SectionTitleType.decode(decoder)
    }
    
    enum CodingKeys: CodingKey {
        case title
    }
}

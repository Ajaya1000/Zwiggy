//
//  SectionTitle.swift
//  Zwiggy
//
//  Created by Ajaya Mati on 09/04/24.
//

import Foundation

// MARK: - SectionTitleType
enum SectionTitleType: String, Decodable {
    case image = "IMAGE"
    case label = "LABEL"
}

extension SectionTitleType {
    static func decode(_ decoder: Decoder) throws -> any SectionTitle {
        let container = try decoder.container(keyedBy: SectionTitleCodingKeys.self)
        let type = try container.decodeIfPresent(SectionTitleType.self, forKey: .type)
        
        switch type {
        case .label:
            return try SectionLabelTitle(from: decoder)
        case .image:
            return try SectionImageTitle(from: decoder)
        default:
            throw DecodingError.valueNotFound((any SectionTitle).self,
                                              .init(codingPath: [SectionTitleCodingKeys.type],
                                                    debugDescription: "No model for the type"))
        }
    }
}
// MARK: - SectionTitleType
protocol SectionTitle: Decodable {
    var type: SectionTitleType? { get set }
}

// MARK: - SectionTitleCodingKeys
enum SectionTitleCodingKeys: String, CodingKey {
    case type
}

// MARK: - SectionLabelTitle
struct SectionLabelTitle: SectionTitle {
    var type: SectionTitleType?
    
    var titleLabel: SectionLabelStyle?
}

// MARK: - SectionImageTitle
struct SectionImageTitle: SectionTitle {
    var type: SectionTitleType?
    
    var titleImage: SectionImageStyle?
}

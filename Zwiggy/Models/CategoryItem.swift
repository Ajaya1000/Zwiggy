//
//  CategoryItem.swift
//  Zwiggy
//
//  Created by Ajaya Mati on 27/01/24.
//

import Foundation

struct CategoryItem: Decodable, Identifiable {
    var id: String
    var image: String?
    var title: String?
    var items: [String]?
}

struct CategoryList: Decodable {
    var title: String
    var data: [CategoryItem]?
}

//
//  Item.swift
//  Zwiggy
//
//  Created by Ajaya Mati on 26/01/24.
//

import Foundation

struct Item: Decodable, Identifiable, Hashable {
    var id: String?
    var image: String?
    var title: String?
    var quantity: String?
    var discountedPrice: Double?
    var originalPrice: Double?
    var discountDescription: String?
}

struct ItemList: Decodable {
    var data: [Item]?
}

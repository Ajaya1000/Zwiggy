//
//  Item.swift
//  Zwiggy
//
//  Created by Ajaya Mati on 26/01/24.
//

import Foundation

struct Item: Decodable {
    var image: String?
    var title: String?
    var quantity: String?
    var discountedPrice: String?
    var originalPrice: String?
    var discountDescription: String?
}

struct ItemList: Decodable {
    var data: [Item]?
}
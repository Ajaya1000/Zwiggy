//
//  ItemViewModelService.swift
//  Zwiggy
//
//  Created by Ajaya Mati on 06/04/24.
//

import Foundation

// TODO: Remove
protocol ItemViewModelServiceable {
    func getAddedItemCount(for item: Item) -> Int
    func handleItemAddition(for item: Item) -> Void
    func handleItemRemoval(for item: Item) -> Void
}

//
//  LocalCartDatsource.swift
//  Zwiggy
//
//  Created by Ajaya Mati on 19/04/24.
//

import Foundation

@Observable
class LocalCartDatsource {
    private var selectedItems: [Item: Int] = [:]
    
    static let shared = LocalCartDatsource()
    
    init(selectedItems: [Item: Int] = [:]) {
        self.selectedItems = selectedItems
    }
}

extension LocalCartDatsource {
    var items: [SelectedItem] {
        selectedItems.compactMap({ item, count in
            return SelectedItem(count: count, item: item)
        })
    }
    
    func add(item: Item) {
        selectedItems[item] = selectedItems[item].nilCoalascing(0) + 1
    }
    
    func remove(item: Item) {
        if selectedItems[item].nilCoalascing(0) <= 1 {
            selectedItems.removeValue(forKey: item)
        } else {
            selectedItems[item] = selectedItems[item].nilCoalascing(0) - 1
        }
    }
}

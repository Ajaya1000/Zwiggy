//
//  ItemViewModel.swift
//  Zwiggy
//
//  Created by Ajaya Mati on 06/04/24.
//

import UIKit

struct ItemViewModel {
    
    // MARK: - Private Variables
    private let item: Item
    private let repository: InstamartItemRepository
    
    // MARK: - Internal Variables
    let addButtonType: AddButtonType
    
    // MARK: - Initializer
    init(item: Item,
         addButtonType: AddButtonType,
         repository: InstamartItemRepository) {
        self.item = item
        self.addButtonType = addButtonType
        self.repository = repository
    }
}

extension ItemViewModel {
    func addItem() {
        repository.addToCart(item: item)
    }
    
    func removeItem() {
        repository.removeFromCart(item: item)
    }
}

extension ItemViewModel {
    var title: String {
        item.title.nilCoalascing("")
    }
    
    var quantity: String {
        item.quantity.nilCoalascing("")
    }
    
    var discountDescription: String? {
        item.discountDescription
    }
    
    var image: UIImage {
        UIImage(named: item.image.nilCoalascing(""))
            .nilCoalascing(.vegetable)
    }
    
    var discountedPrice: String {
        item.discountedPrice.nilCoalascing(0).toCurrencyString()
    }
    
    var originalPrice: String? {
        item.originalPrice?.toCurrencyString()
    }
    
    var itemCartCount: Int {
        guard let selectedItem = repository.items.first(where: { $0.item == item }) else {
            return 0
        }
        
        return selectedItem.count
    }
}

extension ItemViewModel {
    enum AddButtonType {
        case top
        case bottom
    }
}

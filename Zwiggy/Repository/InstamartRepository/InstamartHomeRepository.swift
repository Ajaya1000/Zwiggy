//
//  InstamartHomeRepository.swift
//  Zwiggy
//
//  Created by Ajaya Mati on 08/04/24.
//

import Foundation

@Observable
class InstamartHomeRepository {
    private var cartService: InstamartCartService
    
    init(cartService: InstamartCartService) {
        self.cartService = cartService
    }
}

extension InstamartHomeRepository {
    var items: [SelectedItem] {
        cartService.items
    }
    
    func addToCart(item: Item) {
        cartService.add(item: item)
    }
    
    func removeFromCart(item: Item) {
        cartService.remove(item: item)
    }
}

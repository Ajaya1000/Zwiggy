//
//  InstamartCartRepository.swift
//  Zwiggy
//
//  Created by Ajaya Mati on 07/04/24.
//

class InstamartItemRepository {
    var service: InstamartCartService
    
    init(service: InstamartCartService) {
        self.service = service
    }
}

// MARK: - Private Methods
private extension InstamartItemRepository {
    
}

// MARK: - Internal Methods
extension InstamartItemRepository {
    var items: [SelectedItem] {
        service.items
    }
    
    func addToCart(item: Item) {
        service.add(item: item)
    }
    
    func removeFromCart(item: Item) {
        service.remove(item: item)
    }
}

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
    func add(item: Item) {
        
    }
    
    func remove(item: Item) {
        
    }
    
    func fetchAll() -> [SelectedItem] {
        return []
    }
    
    func count(item: Item) -> Int {
        return 0
    }
}

//
//  InstamartRepositoryFactory.swift
//  Zwiggy
//
//  Created by Ajaya Mati on 09/04/24.
//

import Foundation

class InstamartRepositoryFactory {
    private var serviceProvider: InstamartServiceProvider
    
    init(serviceProvider: InstamartServiceProvider = InstamartServiceFactory()) {
        self.serviceProvider = serviceProvider
    }
}

extension InstamartRepositoryFactory: InstamartRepositoryProvider {
    func getItemRepository() -> InstamartItemRepository {
        let cartService = serviceProvider.getCartService()
        return InstamartItemRepository(service: cartService)
    }
}

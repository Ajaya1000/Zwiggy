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
    func getHomeRepository() -> InstamartHomeRepository {
        let cartService = serviceProvider.getCartService()
        return InstamartHomeRepository(cartService: cartService)
    }
    
    func getItemRepository() -> InstamartItemRepository {
        let cartService = serviceProvider.getCartService()
        return InstamartItemRepository(service: cartService)
    }
    
    func getQuickPickRepository() -> InstamrtQuickPickRepository {
        let quickPickService = serviceProvider.getQuickPickService()
        
        return InstamrtQuickPickRepository(service: quickPickService)
    }
}

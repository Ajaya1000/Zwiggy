//
//  InstamartServiceFactory.swift
//  Zwiggy
//
//  Created by Ajaya Mati on 06/04/24.
//

class InstamartServiceFactory {
    
}

extension InstamartServiceFactory: InstamartServiceProvider {
    func getCartService() -> InstamartCartService {
        return InstamartLocalCartService()
    }
    
    func getQuickPickService() -> any InstamartQuickPickService {
        return InstamartQuickPickLocalService()
    }
    
}

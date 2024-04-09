//
//  ServiceFactory.swift
//  Zwiggy
//
//  Created by Ajaya Mati on 06/04/24.
//

protocol ServiceProvider {
    var instamart: InstamartServiceProvider { get }
    var utility: UtilityServiceProvider { get }
}

class ServiceFactory: ServiceProvider {
    var utility: UtilityServiceProvider
    
    var instamart: InstamartServiceProvider
    
    init(instamart: InstamartServiceProvider = InstamartServiceFactory(),
         utility: UtilityServiceProvider = UtilityServiceFactory()) {
        self.instamart = instamart
        self.utility = utility
    }
}

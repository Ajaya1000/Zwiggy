//
//  Factory.swift
//  Zwiggy
//
//  Created by Ajaya Mati on 07/04/24.
//

import Foundation

protocol FactoryProvider {
    var service: ServiceProvider { get }
    var viewModel: ViewModelProvider { get }
}

class Factory: FactoryProvider {
    var service: ServiceProvider
    
    var viewModel: ViewModelProvider
    
    static var shared = Factory()
    
    init(service: ServiceProvider = ServiceFactory(),
         viewModel: ViewModelProvider = ViewModelFactory()) {
        self.service = service
        self.viewModel = viewModel
    }
}

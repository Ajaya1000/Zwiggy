//
//  ViewModelFactory.swift
//  Zwiggy
//
//  Created by Ajaya Mati on 06/04/24.
//

protocol ViewModelProvider {
    var instamart: InstamartViewModelProvider { get }
}

class ViewModelFactory: ViewModelProvider {
    var instamart: InstamartViewModelProvider
    
    init(instaMart: InstamartViewModelProvider = InstamartViewModelFactory()) {
        self.instamart = instaMart
    }
}

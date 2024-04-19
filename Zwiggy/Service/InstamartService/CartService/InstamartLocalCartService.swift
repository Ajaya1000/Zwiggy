//
//  InstamartLocalCartService.swift
//  Zwiggy
//
//  Created by Ajaya Mati on 09/04/24.
//

import SwiftUI

@Observable
class InstamartLocalCartService {
    let datasource: LocalCartDatsource
    
    init(datasource: LocalCartDatsource = .shared) {
        self.datasource = datasource
    }
}

extension InstamartLocalCartService: InstamartCartService {
    var items: [SelectedItem] {
        datasource.items
    }
    
    func add(item: Item) {
        datasource.add(item: item)
    }
    
    func remove(item: Item) {
        datasource.remove(item: item)
    }
}

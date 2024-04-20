//
//  QuickPickViewModel.swift
//  Zwiggy
//
//  Created by Ajaya Mati on 20/04/24.
//

import Foundation

@Observable
class QuickPickViewModel {
    let repository: InstamrtQuickPickRepository
    
    init(repository: InstamrtQuickPickRepository) {
        self.repository = repository
    }
}

extension QuickPickViewModel {
    var items: [Item] {
        repository.items
    }
}

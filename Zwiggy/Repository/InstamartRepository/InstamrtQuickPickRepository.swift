//
//  InstamrtQuickPickRepository.swift
//  Zwiggy
//
//  Created by Ajaya Mati on 20/04/24.
//

import Foundation

@Observable
class InstamrtQuickPickRepository {
    let service: InstamartQuickPickService
    
    init(service: InstamartQuickPickService) {
        self.service = service
    }
}

extension InstamrtQuickPickRepository {
    var items: [Item] {
        service.items
    }
}

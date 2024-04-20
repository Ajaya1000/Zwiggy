//
//  InstamartQuickPickLocalService.swift
//  Zwiggy
//
//  Created by Ajaya Mati on 20/04/24.
//

import Foundation

@Observable
class InstamartQuickPickLocalService: InstamartQuickPickService {
    private var itemList: ItemList?
    
    init() {
        self.itemList = Zutil.readJson("items")
    }
}

extension InstamartQuickPickLocalService {
    var items: [Item] {
        itemList?.data ?? []
    }
}

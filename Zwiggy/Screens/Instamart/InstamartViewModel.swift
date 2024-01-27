//
//  InstamartViewModel.swift
//  Zwiggy
//
//  Created by Ajaya Mati on 25/01/24.
//

import SwiftUI

@Observable
class InstamartViewModel {
    var searchText: String = ""
    var categories: CategoryList?
    var itemList: ItemList?
    
    init() {
        self.categories = Zutil.readJson("categories")
        self.itemList = Zutil.readJson("items")
    }
}

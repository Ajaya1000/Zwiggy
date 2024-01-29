//
//  InstamartViewModel.swift
//  Zwiggy
//
//  Created by Ajaya Mati on 25/01/24.
//

import SwiftUI

struct SelectedItem {
    var id: String
    var quantity: Int
}

@Observable
class InstamartViewModel {
    var searchText: String = ""
    var categories: CategoryList?
    var itemList: ItemList?
    var navigationPath: NavigationPath
    var selectedItems: [SelectedItem] = []
    
    private var quickPickItemList: [String] = []
    
    init() {
        self.categories = Zutil.readJson("categories")
        self.itemList = Zutil.readJson("items")
        self.navigationPath = .init()
        
        
        self.quickPickItemList = itemList?.data?.compactMap({$0.id}) ?? []
    }
}

extension InstamartViewModel {
    func getItem(for ids: [String]?) -> [Item] {
        guard let ids,
              let itemListData = itemList?.data else {
            return []
        }
        
        return itemListData.filter { ids.contains($0.id.nilCoalascing(""))}
    }
    
    func getQuickPickItemDataList() -> [Item] {
        guard let itemListData = itemList?.data else {
            return []
        }
        
        return itemListData.filter { quickPickItemList.contains($0.id.nilCoalascing(""))}
    }
}

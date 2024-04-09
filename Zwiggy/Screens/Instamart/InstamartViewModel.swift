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
    var selectedItems: [String: Int] = [:]
    
    // NavigationPath
    var navigationPath: [Screen]
    
    private var quickPickItemList: [String] = []
    
    init() {
        self.categories = Zutil.readJson("categories")
        self.itemList = Zutil.readJson("items")
        self.navigationPath = []
        
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
    
    func getItem(for id: String) -> Item? {
        itemList?.data?.first(where: {$0.id == id})
    }
}

extension InstamartViewModel {
    var isCartVisible: Bool {
        guard getTotalAddedItemCount() > 0 else {
            return false
        }
        
        guard let visibleScreen = navigationPath.last else {
            return true // Home Screen
        }
        
        return visibleScreen.shouldShowCart
    }
    
    func addToCart(item: Item) {
        guard let id = item.id else {
            return
        }
        
        selectedItems[id] = selectedItems[id].nilCoalascing(0) + 1
    }
    
    func removeFromCart(item: Item) {
        guard let id = item.id else {
            return
        }
        
        if selectedItems[id] == 1 {
            selectedItems.removeValue(forKey: id)
        } else {
            selectedItems[id] = selectedItems[id].nilCoalascing(0) - 1
        }
    }
    
    func getTotalAddedItemCount() -> Int {
        selectedItems.reduce(0) { $0 + $1.value}
    }
    
    func getAddedItemCount(for item: Item) -> Int {
        guard let id = item.id else {
            return 0
        }
        
        return selectedItems[id].nilCoalascing(0)
    }
    
    func getSelectedItemList() -> [SelectedItem] {
        selectedItems.compactMap({ key, value in
            guard let item = getItem(for: key) else {
                return nil
            }
                
            return SelectedItem(count: value, item: item)
        })
    }
    
    func getTotalAmountInCart() -> String {
        let items = getSelectedItemList()
        
        let value = items.reduce(0.0) { partialResult, selectedItem in
            partialResult + Double(selectedItem.item.discountedPrice.nilCoalascing(0) * Double(selectedItem.count))
        }
        
        return String(format: "%.1f", value)
    }
}

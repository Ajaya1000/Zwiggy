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
    private var repository: InstamartHomeRepository
    
    // NavigationPath
    var navigationPath: [Screen]
    
    private var quickPickItemList: [String] = []
    
    init(repository: InstamartHomeRepository) {
        self.repository = repository
        
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
        repository.addToCart(item: item)
    }
    
    func removeFromCart(item: Item) {
        repository.removeFromCart(item: item)
    }
    
    func getTotalAddedItemCount() -> Int {
        repository.items.reduce(0) { $0 + $1.count }
    }
    
    func getAddedItemCount(for item: Item) -> Int {
        guard let selectedItem = repository.items.first(where: { $0.item == item }) else {
            return 0
        }
        
        return selectedItem.count
    }
    
    func getSelectedItemList() -> [SelectedItem] {
        repository.items
    }
    
    func getTotalAmountInCart() -> String {
        let items = getSelectedItemList()
        
        let value = items.reduce(0.0) { partialResult, selectedItem in
            partialResult + Double(selectedItem.item.discountedPrice.nilCoalascing(0) * Double(selectedItem.count))
        }
        
        return String(format: "%.1f", value)
    }
}

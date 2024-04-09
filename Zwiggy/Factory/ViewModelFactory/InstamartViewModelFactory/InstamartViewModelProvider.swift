//
//  InstamartViewModelProvider.swift
//  Zwiggy
//
//  Created by Ajaya Mati on 06/04/24.
//

protocol InstamartViewModelProvider {
    func getHomeViewModel() -> InstamartViewModel
    
    func getItemViewModel(with item: Item,
                          addButtonType: ItemViewModel.AddButtonType) -> ItemViewModel
}

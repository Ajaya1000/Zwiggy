//
//  InstamartViewModelFactory.swift
//  Zwiggy
//
//  Created by Ajaya Mati on 06/04/24.
//

import Foundation

class InstamartViewModelFactory {
    var repositoryProvider: InstamartRepositoryProvider
    
    init(repositoryProvider: InstamartRepositoryProvider = InstamartRepositoryFactory()) {
        self.repositoryProvider = repositoryProvider
    }
}

extension InstamartViewModelFactory: InstamartViewModelProvider {
    func getQuickPickViewModel() -> QuickPickViewModel {
        let repository = repositoryProvider.getQuickPickRepository()
        return QuickPickViewModel(repository: repository)
    }
    
    func getHomeViewModel() -> InstamartViewModel {
        
        return InstamartViewModel(repository: repositoryProvider.getHomeRepository())
    }
    
    func getItemViewModel(with item: Item,
                          addButtonType: ItemViewModel.AddButtonType) -> ItemViewModel {
        
        let repository = repositoryProvider.getItemRepository()
        
        return ItemViewModel(item: item,
                      addButtonType: addButtonType,
                      repository: repository)
    }
}

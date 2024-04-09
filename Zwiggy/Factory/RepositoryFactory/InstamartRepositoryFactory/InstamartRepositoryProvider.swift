//
//  InstamartRepositoryProvider.swift
//  Zwiggy
//
//  Created by Ajaya Mati on 09/04/24.
//

import Foundation

protocol InstamartRepositoryProvider {
    func getItemRepository() -> InstamartItemRepository
}

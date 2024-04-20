//
//  InstamartServiceProvider.swift
//  Zwiggy
//
//  Created by Ajaya Mati on 06/04/24.
//

protocol InstamartServiceProvider {
    func getCartService() -> InstamartCartService
    func getQuickPickService() -> InstamartQuickPickService
}

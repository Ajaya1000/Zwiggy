//
//  InstamartQuickPickService.swift
//  Zwiggy
//
//  Created by Ajaya Mati on 20/04/24.
//

import Foundation

protocol InstamartQuickPickService: Observation.Observable {
    var items: [Item] { get }
}

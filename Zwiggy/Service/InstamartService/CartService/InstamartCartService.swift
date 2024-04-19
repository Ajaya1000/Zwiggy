//
//  InstamartCartServiceable.swift
//  Zwiggy
//
//  Created by Ajaya Mati on 07/04/24.
//

import SwiftUI

protocol InstamartCartService: Observation.Observable {
    var items: [SelectedItem] { get }
    
    func add(item: Item)
    
    func remove(item: Item)
}

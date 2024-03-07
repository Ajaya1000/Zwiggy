//
//  Numeric.swift
//  Zwiggy
//
//  Created by Ajaya Mati on 01/02/24.
//

import Foundation

extension Numeric {
    func toString() -> String {
        "\(self)"
    }
    
    func toCurrencyString(_ currency: Currency = .rupee) -> String {
        currency.rawValue + toString()
    }
}

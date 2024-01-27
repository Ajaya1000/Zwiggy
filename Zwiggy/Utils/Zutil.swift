//
//  Zutil.swift
//  Zwiggy
//
//  Created by Ajaya Mati on 27/01/24.
//

import Foundation

class Zutil {
    static func readJson<T: Decodable>(_ fileName: String) -> T? {
        guard let file = Bundle.main.path(forResource: fileName, ofType: "json"),
              let data = try? String(contentsOfFile: file).data(using: .utf8) else {
            return nil
        }
        
        return try? JSONDecoder().decode(T.self, from: data)
    }
}

//
//  AdsCategoriesView.swift
//  Zwiggy
//
//  Created by Ajaya Mati on 25/01/24.
//

import SwiftUI

struct AdsCategoriesView: View {
    var list: [String] = ["1","2","3","4","5","6","7","8","9","10","11","12"]
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            LazyHGrid(rows: [GridItem(), GridItem()],
                      alignment: .top,
                      spacing: 18.0) {
                ForEach(list, id: \.self) { i in
                    CategoryViewItem(backgroundColor: .magenta, description: "up to 60% off", title: "Cooking Essential \(i)", image: .init(systemName: "play.circle.fill")!)
                }
            }
        }
    }
}

//
//  CategoriesView.swift
//  Zwiggy
//
//  Created by Ajaya Mati on 26/01/24.
//

import SwiftUI

struct CategoriesView: View {
    var list: [String] = ["1","2","3","4","5","6","7","8","9","10","11"]
    let gridLayout = [GridItem(.fixed(100), spacing: 24.0, alignment: .center),
                      GridItem(.fixed(100), spacing: 24.0, alignment: .center),
                      GridItem(.fixed(100), spacing: 24.0, alignment: .center)]
    var body: some View {
        VStack(alignment: .leading) {
            Text("Shop By Category")
                .font(.zHeadline)
                LazyVGrid(columns: gridLayout,
                          alignment: .center,
                          spacing: 12.0) {
                    ForEach(list, id: \.self) { i in
                        CategoryViewItem(backgroundColor: .orange, description: nil, title: "Cooking Essential \(i)", image: .init(systemName: "play.circle.fill")!)
                    }
            }
        }
    }
}


#Preview {
    CategoriesView()
}

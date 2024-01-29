//
//  CategoriesView.swift
//  Zwiggy
//
//  Created by Ajaya Mati on 26/01/24.
//

import SwiftUI

struct CategoriesView: View {
    var data: CategoryList
    
    @Environment(InstamartViewModel.self) var viewModel: InstamartViewModel
    
    let gridLayout = [GridItem(.fixed(100), spacing: 24.0, alignment: .leading),
                      GridItem(.fixed(100), spacing: 24.0, alignment: .center),
                      GridItem(.fixed(100), spacing: 24.0, alignment: .trailing)]
    var body: some View {
        VStack(alignment: .leading) {
            Text(data.title)
                .font(.zHeadline)
            if let list = data.data {
                LazyVGrid(columns: gridLayout,
                          alignment: .leading,
                          spacing: 12.0) {
                    ForEach(list) { i in
                        CategoryViewItem(description: nil,
                                         title: i.title.nilCoalascing(""),
                                         image: .init(named: i.image.nilCoalascing("")).nilCoalascing(.apple))
                        .onTapGesture {
                            viewModel.navigationPath.append(i)
                        }
                    }
            }
            } else {
                EmptyView()
            }
        }
    }
}


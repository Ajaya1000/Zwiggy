//
//  QuickPickView.swift
//  Zwiggy
//
//  Created by Ajaya Mati on 26/01/24.
//

import SwiftUI

struct QuickPickView: View {
    @Environment(InstamartViewModel.self) var viewModel: InstamartViewModel
    
    let gridLayout = [GridItem(), GridItem()]
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Your quick picks")
                .font(.zHeadline)
            
            ScrollView(.horizontal, showsIndicators: false) {
                LazyHGrid(rows: gridLayout,
                          alignment: .top,
                          spacing: 18.0) {
                    ForEach(viewModel.getQuickPickItemDataList()) { item in
                        ItemView(image: item.image,
                                 title: item.title,
                                 quantity: item.quantity,
                                 price: item.discountedPrice,
                                 originalPrice: item.originalPrice,
                                 discountText: item.discountDescription,
                                 addButtonType: .top)
                        .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/)
                        .padding(.init(top: 0, leading: 0, bottom: 8.0, trailing: 0))
                    }
                }
                .padding(.init(top: 8.0, leading: 0, bottom: 0, trailing: 0))
            }
        }
    }

}

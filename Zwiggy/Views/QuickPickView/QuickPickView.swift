//
//  QuickPickView.swift
//  Zwiggy
//
//  Created by Ajaya Mati on 26/01/24.
//

import SwiftUI

struct QuickPickView: View {
    var viewModel: QuickPickViewModel
    
    let gridLayout = [GridItem(), GridItem()]
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Your quick picks")
                .font(.zHeadline)
            
            ScrollView(.horizontal, showsIndicators: false) {
                LazyHGrid(rows: gridLayout,
                          alignment: .top,
                          spacing: 18.0) {
                    ForEach(viewModel.items) { item in
                        ItemView(viewModel: Factory.shared.viewModel.instamart.getItemViewModel(with: item,
                                                                                                addButtonType: .top))
                        .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/)
                        .padding(.init(top: 0, leading: 0, bottom: 8.0, trailing: 0))
                    }
                }
                .padding(.init(top: 8.0, leading: 0, bottom: 0, trailing: 0))
            }
        }
    }

}

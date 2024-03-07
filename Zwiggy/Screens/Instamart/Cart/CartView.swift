//
//  CartView.swift
//  Zwiggy
//
//  Created by Ajaya Mati on 01/02/24.
//

import SwiftUI

struct CartView: View {
    @Environment(InstamartViewModel.self) var viewModel: InstamartViewModel
    var body: some View {
        VStack(alignment: .leading) {
            ScrollView {
                VStack(alignment: .leading) {
                    HStack {
                        Text("Review Items")
                        Spacer()
                    }
                    VStack(spacing: 12) {
                        ForEach(viewModel.getSelectedItemList(), id: \.item.id) { item in
                            CartItemView(item: item.item, count: item.count, onAddition: {}, onRemove: {})
                        }
                    }
                    .padding(2.0)
                    .clipShape(
                        RoundedRectangle(cornerRadius: 12.0)
                    )
                }
            }
        }
        .padding(24.0)
        .navigationBarBackButtonHidden()
        .toolbar {
            ToolbarItemGroup(placement: .topBarLeading) {
                NavHeaderView()
            }
        }
        .toolbarBackground(Color.white, for: .navigationBar)
        .toolbarBackground(.visible, for: .navigationBar)
    }
}

#Preview {
    CartView()
        .environment(InstamartViewModel())
}

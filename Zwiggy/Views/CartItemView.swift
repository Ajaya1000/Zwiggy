//
//  CartItem.swift
//  Zwiggy
//
//  Created by Ajaya Mati on 02/02/24.
//

import SwiftUI

struct CartItemView: View {
    var item: Item
    var count: Int
    var onAddition: () -> Void
    var onRemove: () -> Void
    
    var body: some View {
        HStack(alignment: .center) {
            Image(uiImage: UIImage(named: item.image.nilCoalascing("")).nilCoalascing(.apple))
                .resizable()
                .padding(8.0)
                .frame(width: 60, height: 60)
                .background(Color.zGray)
                .clipShape(RoundedRectangle(cornerRadius: 8.0))
            
            VStack(alignment: .leading) {
                Spacer()
                Text(item.title.nilCoalascing(""))
                Text(item.quantity.nilCoalascing(""))
                Spacer()
            }
            
            Spacer()
            
            VStack {
                Spacer()
                AddItemButtonView(addedItemCount: count, onAddition: onAddition, onRemove: onRemove)
            }
        }
    }
}

#Preview {
    CartItemView(item: Item(title: "boat Airdopes 131 Bluetooth True Wireless in Ear Earbudges With Mic", quantity: "1 Piece"), count: 5, onAddition: {}, onRemove: {})
}

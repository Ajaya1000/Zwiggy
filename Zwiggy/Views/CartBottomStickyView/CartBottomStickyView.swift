//
//  CartBottomStickyView.swift
//  Zwiggy
//
//  Created by Ajaya Mati on 29/01/24.
//

import SwiftUI

struct CartBottomStickyView: View {
    
    @Environment(\.safeAreaInsets) private var safeAreaInsets
    @Environment(InstamartViewModel.self) var viewModel: InstamartViewModel
    
    var body: some View {
        VStack {
            Text("Add Items worth ₹163 & unlock Free Delivery")
                .font(.system(size: 14.0, weight: .light))
            Button(action: {
                viewModel.navigationPath.append(.cart)
            }) {
                HStack(alignment: .center) {
                    Text("\(viewModel.getTotalAddedItemCount()) Items")
                    
                    Divider()
                        .frame(minWidth: 2)
                        .overlay(.white)
                    
                    Text("₹\(viewModel.getTotalAmountInCart())")
                    
                    Text("₹3 saved")
                        .padding(.init(top: 1.0, leading: 8.0, bottom: 1.0, trailing: 8.0))
                        .background(RoundedRectangle(cornerRadius: 4.0)
                            .fill(Color(32, 96, 64, a: 1.0))
                        )
                    
                    Spacer()
                    
                    Text("View Cart")
                        .font(.system(size: 16.0, weight: .heavy))
                }
                .padding()
            }
            .frame(height: 42.0)
            .clipShape(RoundedRectangle(cornerRadius: 8.0))
            .background(RoundedRectangle(cornerRadius: 8.0).fill(Color(51, 153, 102, a: 1.0)))
            .foregroundStyle(.white)
            
            Color.white
                .frame(height: safeAreaInsets.bottom)
        }
        .padding(.init(top: 8.0, leading: 8.0, bottom: 2.0, trailing: 8.0))
        .background(
            UnevenRoundedRectangle(topLeadingRadius: 16.0, topTrailingRadius: 16.0)
            .fill(.white))
        .clipShape(UnevenRoundedRectangle(topLeadingRadius: 16.0, topTrailingRadius: 16.0))
        .shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
        .mask(RoundedRectangle(cornerRadius: 8.0).padding(.top, -20))
    }
}

#Preview {
    ZStack(alignment: .bottom) {
        Color.red
        CartBottomStickyView()
    }
    .environment(Factory.shared.viewModel.instamart.getHomeViewModel())
    .ignoresSafeArea()
}

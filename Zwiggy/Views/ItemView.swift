//
//  ItemView.swift
//  Zwiggy
//
//  Created by Ajaya Mati on 26/01/24.
//

import SwiftUI

struct ItemView: View {
    var item: Item
    var addButtonType: AddButtonType
    
    @Environment(InstamartViewModel.self) var viewModel: InstamartViewModel
    
    var body: some View {
        VStack(spacing: 0) {
            VStack(alignment: .leading) {
                ItemImage()
                Text(item.title.nilCoalascing(""))
                    .font(.zDescription)
                    .lineLimit(2)
            }
            
            Spacer()
            
            VStack(alignment: .leading, spacing: 4.0) {
                Text(item.quantity.nilCoalascing(""))
                    .font(.system(size: 14.0, weight: .thin))
                
                HStack(alignment: .bottom) {
                    ItemPriceView()
                    Spacer()
                    BottomAddButton()
                }
            }
        }
        .padding(.init(top: 0, leading: 0, bottom: 2, trailing: 0))
    }
}

extension ItemView {
    @ViewBuilder func ItemPriceView() -> some View {
        if addButtonType == .top {
            HStack(alignment: .bottom, spacing: 2.0) {
                Text(item.discountedPrice.nilCoalascing(0).toCurrencyString())
                    .font(.system(size: 14.0, weight: .medium))
                
                if let originalPrice = item.originalPrice {
                    Text(originalPrice.toCurrencyString())
                        .strikethrough()
                        .font(.system(size: 10.0, weight: .light))
                } else {
                    EmptyView()
                }
            }
        } else {
            VStack(alignment: .leading) {
                if let originalPrice = item.originalPrice {
                    Text(originalPrice.toCurrencyString())
                        .strikethrough()
                        .font(.system(size: 12.0, weight: .light))
                } else {
                    EmptyView()
                }
                
                Text(item.discountedPrice.nilCoalascing(0).toCurrencyString())
                    .font(.system(size: 16.0, weight: .medium))
            }
        }
    }
    
    @ViewBuilder func BottomAddButton() -> some View {
        if addButtonType == .bottom {
            Button(action: {
                viewModel.addToCart(item: item)
            } , label: {
                Text("Add")
                    .font(.system(size: 14, weight: .bold))
                    .foregroundStyle(Color.init(18, 168, 94))
                    .padding(.init(top: 4.0, leading: 16.0, bottom: 4.0, trailing: 16.0))
                    .background(RoundedRectangle(cornerRadius: 4.0).stroke(Color.zGray, lineWidth: 1.0))
            })
        } else {
            EmptyView()
        }
    }
    
    @ViewBuilder func ItemImage() -> some View {
        Image(uiImage: UIImage(named: item.image.nilCoalascing("")).nilCoalascing(.vegetable))
            .resizable()
            .frame(width: 100, height: 100)
            .background(Color.white)
            .clipShape(RoundedRectangle(cornerRadius: 12.0, style: .circular))
            .overlay(alignment: .topTrailing) {
                TopAddButton()
            }
            .overlay(alignment:  .topLeading) {
                DiscountBadge()
            }
    }
    
    @ViewBuilder func TopAddButton() -> some View {
        if addButtonType == .top {
            Button(action: {
                viewModel.addToCart(item: item)
            }) {
                Text("+")
                    .font(.system(size: 18.0, weight: .bold))
                    .foregroundStyle(Color.green)
                    .frame(width: 30, height: 30)
                    .background(Color.white)
                    .clipShape(RoundedRectangle(cornerRadius: 4.0, style: .circular))
                    .background(RoundedRectangle(cornerRadius: 4.0, style: .circular).stroke(Color.gray))
                    .offset(x: 4,y: -4)
            }
        } else {
            EmptyView()
        }
    }
    
    @ViewBuilder func DiscountBadge() -> some View {
        if let discountText = item.discountDescription {
            Text(discountText)
                .foregroundStyle(Color.white)
                .frame(width: 30, height: 30)
                .font(.system(size: 12.0, weight: .bold))
                .clipShape(RoundedRectangle(cornerRadius: 8.0))
                .background(Color(uiColor: UIColor(red: 232/255, green: 51/255, blue: 0/255, alpha: 1.0)))
                .clipShape(RoundedRectangle(cornerRadius: 4.0, style: .circular))
        } else {
            EmptyView()
        }
    }
}

extension ItemView {
    enum AddButtonType {
        case top
        case bottom
    }
}

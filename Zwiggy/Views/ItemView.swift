//
//  ItemView.swift
//  Zwiggy
//
//  Created by Ajaya Mati on 26/01/24.
//

import SwiftUI

struct ItemView: View {
    let image: UIImage
    let title: String
    let quantity: String = "1 Kg"
    let price: String = "$12"
    let originalPrice: String? = "$15"
    let addButtonType: AddButtonType
    let discountText: String?
    
    var body: some View {
        VStack(spacing: 0) {
            VStack(alignment: .leading) {
                ItemImage()
                Text(title)
                    .font(.zDescription)
                    .lineLimit(2)
            }
            
            Spacer()
            
            VStack(alignment: .leading, spacing: 4.0) {
                Text(quantity)
                    .font(.system(size: 14.0, weight: .thin))
                
                HStack(alignment: .bottom) {
                    ItemPriceView()
                    Spacer()
                    BottomAddButton()
                }
            }
        }
        .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/)
        .padding(.init(top: 0, leading: 0, bottom: 2, trailing: 0))
    }
}

extension ItemView {
    @ViewBuilder func ItemPriceView() -> some View {
        if addButtonType == .top {
            HStack(alignment: .bottom, spacing: 2.0) {
                Text(price)
                    .font(.system(size: 14.0, weight: .medium))
                
                if let originalPrice {
                    Text(originalPrice)
                        .strikethrough()
                        .font(.system(size: 10.0, weight: .light))
                } else {
                    EmptyView()
                }
            }
        } else {
            VStack(alignment: .leading) {
                if let originalPrice {
                    Text(originalPrice)
                        .strikethrough()
                        .font(.system(size: 12.0, weight: .light))
                } else {
                    EmptyView()
                }
                
                Text(price)
                    .font(.system(size: 16.0, weight: .medium))
            }
        }
    }
    
    @ViewBuilder func BottomAddButton() -> some View {
        if addButtonType == .bottom {
            Button(action: {} , label: {
                Text("Add")
                    .font(.system(size: 14, weight: .bold))
                    .foregroundStyle(Color.init(r: 18, g: 168, b: 94))
                    .padding(.init(top: 2, leading: 8, bottom: 2, trailing: 8))
                    .background(RoundedRectangle(cornerRadius: 4.0).stroke(Color.gray, lineWidth: 1.0))
            })
        } else {
            EmptyView()
        }
    }
    
    @ViewBuilder func ItemImage() -> some View {
        Image(uiImage: image)
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
            Text("+")
                .font(.system(size: 18.0, weight: .bold))
                .foregroundStyle(Color.green)
                .frame(width: 30, height: 30)
                .background(Color.white)
                .clipShape(RoundedRectangle(cornerRadius: 4.0, style: .circular))
                .background(RoundedRectangle(cornerRadius: 4.0, style: .circular).stroke(Color.gray))
                .offset(x: 4,y: -4)
        } else {
            EmptyView()
        }
    }
    
    @ViewBuilder func DiscountBadge() -> some View {
        if let discountText {
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

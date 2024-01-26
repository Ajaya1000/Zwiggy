//
//  CategoryViewItem.swift
//  Zwiggy
//
//  Created by Ajaya Mati on 26/01/24.
//

import SwiftUI

struct CategoryViewItem: View {
    var backgroundColor: UIColor
    var description: String?
    var title: String
    var image: UIImage
    
    var body: some View {
        VStack(alignment: .center) {
            ZStack {
                Color(uiColor: backgroundColor)
                Image(uiImage: image)
                Group {
                    if let description {
                        VStack {
                            Spacer()
                            HStack {
                                Spacer()
                                Text(description)
                                    .padding(.init(top: 4.0, leading: 0, bottom: 4.0, trailing: 0.0))
                                    .font(.system(size: 12.0))
                                    .foregroundStyle(Color.white)
                                Spacer()
                            }.background(.blue)
                        }
                    } else {
                        EmptyView()
                    }
                }
            }
            .frame(width: 100, height: 100)
            .clipShape(RoundedRectangle(cornerRadius: 12.0))
            .background(
                RoundedRectangle(cornerRadius: 12.0)
                    .stroke(Color.clear)
            )
            
            Text(title)
                .fixedSize(horizontal: false, vertical: /*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/)
                .font(.system(size: 12.0, weight: .medium))
        }
        .frame(width: 100)
    }
}

#Preview {
    CategoryViewItem(backgroundColor: .magenta, description: nil, title: "Cooking Essential", image: .init(systemName: "play.circle.fill")!)
}

//
//  CategoryViewItem.swift
//  Zwiggy
//
//  Created by Ajaya Mati on 26/01/24.
//

import SwiftUI

struct CategoryViewItem: View {
    var backgroundColor: (any Shape)? = nil
    var description: String? = nil
    var title: String
    var image: UIImage
    
    var body: some View {
        VStack(alignment: .center) {
            ZStack {
                Background()
                Image(uiImage: image)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
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

extension CategoryViewItem {
    @ViewBuilder func Background() -> some View {
        if let backgroundColor {
            AnyView(backgroundColor)
        } else {
            LinearGradient(
                stops: [
                    Gradient.Stop(color: Color(red: 0.46, green: 0.69, blue: 0.9).opacity(0), location: 0.00),
                    Gradient.Stop(color: Color(red: 0.41, green: 0.57, blue: 0.77), location: 1.00),
                ],
                startPoint: UnitPoint(x: 0.5, y: 0),
                endPoint: UnitPoint(x: 0.5, y: 1)
            )
        }
    }
}

#Preview {
    CategoryViewItem(description: nil, title: "Cooking Essential", image: .apple)
}

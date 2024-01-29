//
//  CategoryDetailView.swift
//  Zwiggy
//
//  Created by Ajaya Mati on 27/01/24.
//

import SwiftUI

struct CategoryDetailView: View {
    @Environment(InstamartViewModel.self) var viewModel: InstamartViewModel
    
    var data: CategoryItem
    let columns = [GridItem(spacing: 1.0), GridItem(spacing: 1.0)]
    
    var body: some View {
        ScrollView {
            LazyVGrid(columns: columns, spacing: 1.0) {
                ForEach(viewModel.getItem(for: data.items)) { item in
                    ItemView(
                        image: item.image,
                        title: item.title,
                        quantity: item.quantity,
                        price: item.discountedPrice,
                        originalPrice: item.originalPrice,
                        discountText: item.discountDescription,
                        addButtonType: .bottom
                    )
                    .padding(24.0)
                    .background(.white)
                }
            }
            .padding(2.0)
        }
        .background(Color.zGray1)
        .navigationBarBackButtonHidden()
        .toolbar {
            ToolbarItemGroup(placement: .topBarLeading) {
                HStack {
                    Button(action: {
                        viewModel.navigationPath.removeLast()
                    }, label: {
                        Image(systemName: "arrow.left")
                            .foregroundStyle(Color.black)
                    })
        
                    HStack(spacing: 12.0) {
                        Image(uiImage: .init(named: data.image.nilCoalascing("")).nilCoalascing(.vegetable))
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 30, height: 30)
                            .background(.regularMaterial)
                            .clipShape(RoundedRectangle(cornerRadius: 8.0))
                            .padding(2.0)
                            .clipShape(RoundedRectangle(cornerRadius: 8.0))
                            .background(RoundedRectangle(cornerRadius: 8.0)
                                .stroke(Color.gray, lineWidth: /*@START_MENU_TOKEN@*/1.0/*@END_MENU_TOKEN@*/)
                            )
                        VStack(alignment: .leading, spacing: 0) {
                            Spacer()
                            HStack {
                                Text(data.title.nilCoalascing(""))
                                    .font(.system(size: 16))
                                Image(systemName: "chevron.down")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .padding(4.0)
                                    .frame(width: 16, height: 16)
                                    .foregroundStyle(.black)
                                    .background(Color.zGray)
                                    .clipShape(Circle())
                                    .background(Circle().stroke(Color.gray, lineWidth: 2.0))
                                
                            }
                            
                            Text("\((data.items?.count).nilCoalascing(0)) items")
                                .font(.system(size: 12))
                            Spacer()
                        }
                    }
                }
            }
            
            ToolbarItemGroup(placement: .topBarTrailing) {
                Button {
                    
                } label: {
                    Image(systemName: "magnifyingglass")
                        .resizable()
                        .frame(width: 16, height: 16)
                        .padding(8.0)
                        .background(Color.zGray)
                        .clipShape(Circle())
                        .background(Circle().stroke(Color.gray, lineWidth: 2.0))
                        .foregroundStyle(Color.black)
                }
            }
        }
        .toolbarBackground(Color.white, for: .navigationBar)
        .toolbarBackground(.visible, for: .navigationBar)
    }
}

#Preview {
    NavigationStack {
        CategoryDetailView(data: .init(id: "1",
                                       image: "vegetable",
                                       title: "Fresh Vegetable",
                                       items: ["1","2","3","4","5","6","7","8","9"]))
        .environment(InstamartViewModel())
    }
}

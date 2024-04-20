//
//  NavHeaderView.swift
//  Zwiggy
//
//  Created by Ajaya Mati on 02/02/24.
//

import SwiftUI

struct NavHeaderView: View {
    @Environment(InstamartViewModel.self) var viewModel: InstamartViewModel
    
    var body: some View {
        HStack {
            Button(action: {
                viewModel.navigationPath.removeLast()
            }, label: {
                Image(systemName: "arrow.left")
                    .foregroundStyle(Color.black)
            })
            
            Text("Your Cart")
            Spacer()
        }
        .padding(.leading, 12.0)
    }
}

#Preview {
    NavHeaderView()
        .environment(Factory.shared.viewModel.instamart.getHomeViewModel())
}

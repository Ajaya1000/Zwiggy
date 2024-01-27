//
//  InstamartView.swift
//  Zwiggy
//
//  Created by Ajaya Mati on 24/01/24.
//

import SwiftUI

struct InstamartView: View {
    @Bindable var viewModel = InstamartViewModel()
    
    var body: some View {
        VStack {
            Header(adressTag: "Home",
                   icon: "house",
                   addressName: "#17 Shree Nilayam, Choodasandra, Bangalore",
                   searchText: $viewModel.searchText)
            
            ScrollView(.vertical, showsIndicators: false) {
                VStack(alignment: .leading, spacing: 12.0) {
                    AdsCategoriesView()
                    QuickPickView()
                    CategoriesView(data: viewModel.categories!)
                }
            }
        }
        .padding(.horizontal)
        .background(
            background
        )
    }
}

extension InstamartView {
    var background: LinearGradient {
        LinearGradient(stops: [
            Gradient.Stop(color: Color(red: 1, green: 0.94, blue: 0.98),
                          location: 0.00),
            Gradient.Stop(color: Color(red: 0.92, green: 0.93, blue: 0.96),
                          location: 1.00),
        ],
                       startPoint: UnitPoint(x: 0.5, y: 0),
                       endPoint: UnitPoint(x: 0.5, y: 0.95))
    }
}

#Preview {
    InstamartView()
}

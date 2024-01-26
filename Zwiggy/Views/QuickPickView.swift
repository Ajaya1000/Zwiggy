//
//  QuickPickView.swift
//  Zwiggy
//
//  Created by Ajaya Mati on 26/01/24.
//

import SwiftUI

struct QuickPickView: View {
    var list: [String] = ["1 Patato (Allo gadde) ","2 Patato (Allo gadde) ","3 Patato (Allo gadde) ","Patato (Allo gadde) something somethign","Patato (Allo gadde) something somethign 2","Patato", "Patato 2", "Patato 5", "Patato 9", "Patato 10", "Patato 10202 733"]
    
    let gridLayout = [GridItem(), GridItem()]
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Your quick picks")
                .font(.zHeadline)
            
            ScrollView(.horizontal, showsIndicators: false) {
                LazyHGrid(rows: gridLayout,
                          alignment: .top,
                          spacing: 18.0) {
                    ForEach(Array(list.enumerated()), id: \.element) { index, i in
                        ItemView(image: .init(systemName: "play.circle.fill")!,
                                 title: i,
                                 addButtonType: (index % 2 == 0 ? .top : .bottom),
                                 discountText: (index % 2 == 0 ? "12% Off" : nil)
                        )
                        .padding(.init(top: 0, leading: 0, bottom: 8.0, trailing: 0))
                    }
                }
                .padding(.init(top: 8.0, leading: 0, bottom: 0, trailing: 0))
            }
        }
    }

}

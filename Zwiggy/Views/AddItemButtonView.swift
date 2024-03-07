//
//  AddItemButtonView.swift
//  Zwiggy
//
//  Created by Ajaya Mati on 02/02/24.
//

import SwiftUI

struct AddItemButtonView: View {
    var addedItemCount: Int
    var onAddition: () -> Void
    var onRemove: () -> Void
    
    var body: some View {
        HStack {
            getButtons()
        }
        .padding(.horizontal, 8.0)
        .padding(.vertical, 4.0)
        .background(RoundedRectangle(cornerRadius: 8.0).stroke(Color.gray, lineWidth: 0.5))
    }
}

extension AddItemButtonView {
    @ViewBuilder func getButtons() -> some View {
        Button(for: "-") {
            onRemove()
        }
        
        ButtonLabel(for: "\(addedItemCount)")
        
        Button(for: "+") {
            onAddition()
        }
    }
    
    @ViewBuilder func Button(for label: String, action: @escaping () -> Void) -> some View {
        SwiftUI.Button(action: action, label: {
            ButtonLabel(for: label)
        })
    }
    
    @ViewBuilder func ButtonLabel(for label: String) -> some View {
        Text(label)
            .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
            .foregroundStyle(.green)
            .padding(4.0)
    }
}

// MARK: - Preview
#Preview {
    Container()
}

private struct Container: View {
    @State var count = 5
    var body: some View {
        AddItemButtonView(addedItemCount: count) {
            count += 1
        } onRemove: {
            count -= 1
        }
    }
}

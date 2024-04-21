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
    var defaultType: AddItemButtonViewDefaultType = .add
    
    var body: some View {
        HStack {
            getButtons()
        }
        .padding(.horizontal, 10.0)
        .padding(.vertical, 2.0)
        .background(RoundedRectangle(cornerRadius: 8.0).fill(getBackgroundColor()))
        .background(RoundedRectangle(cornerRadius: 8.0).stroke(Color.gray, lineWidth: 0.5))
    }
}

extension AddItemButtonView {
    @ViewBuilder func getButtons() -> some View {
        if addedItemCount == 0 {
            Button(for: defaultType.value) {
                onAddition()
            }
        } else {
            Button(for: "-") {
                onRemove()
            }
            
            ButtonLabel(for: "\(addedItemCount)")
            
            Button(for: "+") {
                onAddition()
            }
        }
    }
    
    @ViewBuilder func Button(for label: String,
                             style: AddItemButtonStyle = .primary,
                             action: @escaping () -> Void) -> some View {
        SwiftUI.Button(action: action, label: {
            ButtonLabel(for: label, style: style)
        })
    }
    
    @ViewBuilder func ButtonLabel(for label: String, style: AddItemButtonStyle = .primary) -> some View {
        Text(label)
            .font(style.font)
            .foregroundStyle(style.textColor)
            .padding(4.0)
    }
}

extension AddItemButtonView {
    func getBackgroundColor() -> Color {
        let type: AddItemButtonStyle = .primary
        
        return type.backgroundColor
    }
}

// MARK: - Preview
#Preview {
    Container()
}

private struct Container: View {
    @State var count = 0
    var body: some View {
        AddItemButtonView(addedItemCount: count) {
            count += 1
        } onRemove: {
            count -= 1
        }
    }
}

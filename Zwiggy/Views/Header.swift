//
//  Header.swift
//  Zwiggy
//
//  Created by Ajaya Mati on 25/01/24.
//

import SwiftUI

struct SearchBar: View {
    @Binding var searchText: String
    
    var body: some View {
        HStack(spacing: 4.0) {
            TextField("Search for item", text: $searchText)
            Image(systemName: "magnifyingglass")
        }
        .padding(12.0)
        .background(Color.white)
        .clipShape(
            RoundedRectangle(cornerRadius: 8.0)
        )
        .background(
            RoundedRectangle(cornerRadius: 8.0)
                .stroke(Color.gray)
        )
    }
}

struct ProfileHeaderView: View {
    let adressTag: String
    let icon: String
    let addressName: String
    
    var body: some View {
        HStack(spacing: 8.0) {
            VStack(alignment: .leading, spacing: 4.0) {
                HStack {
                    Image(systemName: icon)
                    Text(adressTag)
                    Image(systemName: "chevron.down")
                }
                .font(.zHeadline)
                
                Text(addressName)
                    .lineLimit(1)
                    .font(.zsubTitle)
            }
            Spacer()
            Image(systemName: "person.circle")
                .resizable()
                .frame(width: 30, height: 30)
        }
    }
}

struct Header: View {
    let adressTag: String
    let icon: String
    let addressName: String
    
    @Binding var searchText: String
    
    var body: some View {
        VStack(spacing: 12.0) {
            ProfileHeaderView(adressTag: adressTag, icon: icon, addressName: addressName)
            SearchBar(searchText: $searchText)
        }
    }
}

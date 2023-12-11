//
//  SearchBar.swift
//  Moment
//
//  Created by 백대홍 on 12/11/23.
//

import SwiftUI

struct SearchBar: View {
    @State var searchBookText = ""
    var body: some View {
        HStack(alignment: .center, spacing: 0) {
            Image(systemName: "magnifyingglass")
                .foregroundStyle(Color.secondary)
            
            Spacer()
            TextField("책 제목", text: $searchBookText)
        }
        .padding(.horizontal, 8)
        .padding(.vertical, 7)
        .frame(width: .infinity, height: 40, alignment: .leading)
        .background(.white)
        .cornerRadius(10)
        .overlay(
            RoundedRectangle(cornerRadius: 10)
                .stroke(Color.mainBrown, lineWidth: 2)
        )
    }
}

#Preview {
    SearchBar()
}

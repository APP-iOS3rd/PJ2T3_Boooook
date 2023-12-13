//
//  SearchBar.swift
//  Moment
//
//  Created by 백대홍 on 12/13/23.
//

import SwiftUI

struct SearchBar: View {
    @State var searchText = ""
    
    var body: some View {
        HStack(alignment: .center, spacing: 0) {
            Image(systemName: "magnifyingglass")
                .foregroundStyle(Color.secondary)
                .padding(.leading)
            
            Spacer()
            
            TextField("책 제목", text: $searchText)
                .textInputAutocapitalization(.never)
            
            Button(action: {
                print("검색 버튼이 클릭되었습니다.")
            }) {
                Text("검색")
                    .frame(width: 100,height: 40)
                    .background(Color.mainBrown)
                    .foregroundColor(Color.white)
                    .clipShape(.rect(bottomTrailingRadius: 10, topTrailingRadius: 10))
            }
        }
        .frame(height: 40, alignment: .leading)
        .background(Color.white)
        .cornerRadius(10)
        .overlay(
            RoundedRectangle(cornerRadius: 15)
                .stroke(Color.mainBrown, lineWidth: 2)
        )
    }
}



#Preview {
    SearchBar()
}

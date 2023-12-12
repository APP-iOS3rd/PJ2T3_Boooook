//
//  SelectedBookListView.swift
//  Moment
//
//  Created by 홍세희 on 2023/12/12.
//

import SwiftUI

struct SelectedBookListView: View {
    var body: some View {
        NavigationStack {
            VStack(spacing: -30) {
//                SearchBar()
//                    .padding(20)
                VStack(alignment: .leading, spacing: -30) {
                    Text("기록한 책")
                        .font(Font.semibold18)
                        .padding(30)
                    ScrollView {
                        VStack(alignment: .leading, spacing: -30) {
                            ForEach(bookInfo) { bookInfo in
                                NavigationLink(destination: Text("태스트용")) {
                                    SelectedBookCell(bookInfo: bookInfo)
                                }
                                CustomListDivider()
                            }
                        }
                    }
                }
            }
        }
    }
}

#Preview {
    SelectedBookListView()
}

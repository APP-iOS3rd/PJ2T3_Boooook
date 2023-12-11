//
//  ShelfRecordListView.swift
//  Moment
//
//  Created by 홍세희 on 2023/12/11.
//

import SwiftUI

struct ShelfRecordListView: View {
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(alignment: .leading, spacing: -20) {
                    CustomListDivider()
                    ForEach(bookData) { bookdata in
                        NavigationLink(destination: Text("테스트 이동 뷰입니다.")) {
                            ShelfRecordCellView(bookdata: bookdata)
                        }
                        CustomListDivider()
                    }
                }
            }
        }
    }
}

#Preview {
    ShelfRecordListView()
}

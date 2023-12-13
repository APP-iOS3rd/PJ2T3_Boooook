//
//  ShelfRecordListView.swift
//  Moment
//
//  Created by 홍세희 on 2023/12/12.
//

import SwiftUI

struct ShelfRecordListView: View {
    let bookISBN: String
    var bookRecordList: [MyRecord] {
        UserData.mangjaeData.recordList.filter { $0.bookISBN == self.bookISBN }
    }
    var recordYearList: [Int] {
        Set(bookRecordList.map { $0.year }).sorted { $0 > $1 }
    }
    var bookTitle: String {
        UserData.mangjaeData.bookList.first { $0.bookISBN == bookISBN }?.title ?? ""
    }
    
    var body: some View {
        ScrollView {
            ForEach(recordYearList, id: \.self) { year in
                let bookRecordList = bookRecordList.filter { $0.year == year }
                VStack(alignment: .leading, spacing: -20) {
                    RecordYearView(year: year)
                        .padding(20)
                    ForEach(bookRecordList, id: \.id) { record in
                        CustomListDivider()
                        NavigationLink(destination: Text("테스트 이동 뷰입니다.")) {
                            ShelfRecordCellView(recordId: record.id)
                        }
                    }
                }
                
            }
        }
        .navigationTitle(bookTitle)
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    ShelfRecordListView(bookISBN: "1")
}

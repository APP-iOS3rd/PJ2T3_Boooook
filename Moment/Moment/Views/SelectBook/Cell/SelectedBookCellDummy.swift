//
//  SelectedBookCellDummy.swift
//  Moment
//
//  Created by 홍세희 on 2023/12/13.
//

import SwiftUI

struct SelectedBookDummyCell: View {
    let bookInfo: MyBook
    var body: some View {
        VStack(spacing: 20) {
            HStack(alignment: .top, spacing: 20) {
                Image(bookInfo.theCoverOfBook)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 70, height: 87)
                    .clipped()
                VStack(alignment: .leading, spacing: 10) {
                    Text(bookInfo.title)
                        .font(Font.medium16)
                        .foregroundStyle(Color.black)
                        .multilineTextAlignment(.leading)
                    
                    VStack(alignment: .leading) {
                        Text(bookInfo.author)
                        Text(bookInfo.publisher)
                    }
                    .font(Font.medium14)
                    .foregroundStyle(Color.gray)
                }
            }
        }
        .padding(30)
    }
}

//#Preview {
//    SelectedBookDummyCell(bookInfo: BookInfoStruct(image: "bookex1", title: "마흔에 읽는 쇼펜하우어 마흔에 읽는 쇼펜하우어 마흔에 읽는 쇼펜하우어", author: "강용수 (지은이)", publisher: "유노북스"))
//}

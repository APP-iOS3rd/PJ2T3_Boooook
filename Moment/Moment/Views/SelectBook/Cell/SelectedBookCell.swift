//
//  SelectedBookCell.swift
//  Moment
//
//  Created by 홍세희 on 2023/12/12.
//

import SwiftUI

struct SelectedBookCell: View {
    var bookInfo: SelectedBook
    var body: some View {
        VStack(spacing: 20) {
            HStack(alignment: .top, spacing: 20) {
                fetchImage(url: bookInfo.theCoverOfBook)
                VStack(alignment: .leading, spacing: 10) {
                    Text(bookInfo.title)
                        .font(Font.medium16)
                        .foregroundStyle(Color.black)
                        .multilineTextAlignment(.leading)
                        .lineLimit(3)
                    
                    VStack(alignment: .leading) {
                        Text(bookInfo.author)
                        Text(bookInfo.publisher)
                    }
                    .font(Font.medium14)
                    .foregroundStyle(Color.gray)
                    .lineLimit(1)
                }
            }
        }
        .padding(30)
    }
    
    func fetchImage(url: String) -> some View {
        AsyncImage(url: URL(string: url)) { image in
            image.resizable()
                .aspectRatio(contentMode: .fill)
        } placeholder: {
            ProgressView()
        }
        .frame(width: 70, height: 87)
        .clipped()
    }
}





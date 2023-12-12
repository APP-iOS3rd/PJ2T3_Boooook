//
//  MapToRecordCell.swift
//  Moment
//
//  Created by 홍세희 on 2023/12/11.
//

import SwiftUI

struct MapToRecordCell: View {
    var bookdata: RecordDataStruct
    var body: some View {
        VStack(spacing: 20) {
            HStack(alignment: .top) {
                Image(bookdata.image)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 90, height: 90)
                    .clipShape(
                        .rect(topLeadingRadius: 10.0, bottomLeadingRadius: 10.0, bottomTrailingRadius: 10.0, topTrailingRadius: 10.0)
                    )
                VStack(alignment: .leading, spacing: 10) {
                    HStack(alignment: .bottom) {
                        Text(bookdata.changeDayToString())
                            .font(Font.medium16)
                            .foregroundStyle(Color.darkBrown)
                        Text(bookdata.changeTimeToString())
                            .font(Font.medium14)
                            .foregroundStyle(Color.darkBrown)
                            .foregroundStyle(Color.black)
                    }
                    Text("“" + bookdata.contents + "“")
                        .font(Font.regular16)
                        .font(.system(size: 16.0))
                        .foregroundStyle(Color.black)
                        .multilineTextAlignment(.leading)
                        .lineLimit(2)
                }
            }
        }
        .padding()
    }
}

struct RecordYearView: View {
    var bookdata: RecordDataStruct
    var body: some View {
        Text(bookdata.changeYearToString())
            .foregroundColor(Color.mainBrown)
            .multilineTextAlignment(.leading)
            .padding(.horizontal, 10)
            .background(Color.offBrown)
            .cornerRadius(10)
            .fixedSize(horizontal: false, vertical: false)
    }
}

#Preview {
    MapToRecordCell(bookdata: RecordDataStruct(date: testDate, image: "roofi", contents: "줄거리입니다.. 예.. 트렌드 코리아.."))
}

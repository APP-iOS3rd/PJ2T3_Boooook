//
//  ShelfRecordListView.swift
//  Moment
//
//  Created by 홍세희 on 2023/12/12.
//

import SwiftUI

struct ShelfRecordListView: View {
    //MARK: 연도 어떻게 받아올지 고민해보기
    var RecordYear: [String] = ["2023", "2024"]
    var body: some View {
        NavigationStack {
            ScrollView {
                ForEach(0..<RecordYear.count) { index in
                    VStack(alignment: .leading, spacing: -20) {
                        Text(RecordYear[index])
                            .foregroundColor(Color.darkBrown)
                            .multilineTextAlignment(.leading)
                            .padding(.horizontal, 10)
                            .background(Color.offBrown)
                            .cornerRadius(10)
                            .fixedSize(horizontal: false, vertical: false)
                            .padding(20)
                        ForEach(bookData) { bookdata in
                            CustomListDivider()
                            NavigationLink(destination: Text("테스트 이동 뷰입니다.")) {
                                //RecordYearView(bookdata: bookdata
                                ShelfRecordCellView(bookdata: bookdata)
                            }
                        }
                    }
                    
                }
            }
        }
    }
}

#Preview {
    ShelfRecordListView()
}

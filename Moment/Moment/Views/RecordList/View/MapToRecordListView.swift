//
//  MapToRecordListView.swift
//  Moment
//
//  Created by 홍세희 on 2023/12/11.
//

import SwiftUI

struct MapToRecordListView: View {
    //MARK: 연도 어떻게 받아올지 고민해보기
    var bookTitle: [String] = ["아메리칸 프로메테우스", "미움받을 용기"]
    var body: some View {
        NavigationStack {
            ScrollView {
                ForEach(0..<bookTitle.count) { index in
                    VStack(alignment: .leading, spacing: -20) {
                        Text(bookTitle[index])
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
                                MapToRecordCell(bookdata: bookdata)
                            }
                        }
                    }
                    
                }
            }
        }
    }
}

#Preview {
    MapToRecordListView()
}


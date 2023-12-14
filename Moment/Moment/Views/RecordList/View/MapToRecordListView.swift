//
//  MapToRecordListView.swift
//  Moment
//
//  Created by 홍세희 on 2023/12/12.
//

import SwiftUI
import SwiftData

struct MapToRecordListView: View {
	@Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
	
	@Query var bookList: [MomentBook]
	
    let bookISBNList: [String]
    let recordList: [MomentRecord]
    let localName: String // 지역명 (네비 타이틀)
    
    var body: some View {
        ScrollView {
            ForEach(bookISBNList, id: \.self) { isbn in
                let bookRecordList = recordList.filter { $0.bookISBN == isbn }
                let bookTitle = bookList.first { $0.bookISBN == isbn }?.title
                VStack(alignment: .leading, spacing: -20) {
                    RecordBookTitleView(title: bookTitle ?? "")
                        .padding(20)
                    ForEach(bookRecordList, id: \.id) { record in
                        CustomListDivider()
						NavigationLink {
							RecordDetailView(recordID: record.id)
						} label: {
							ShelfRecordCellView(recordId: record.id)
						}
                    }
                }
            }
        }
        .navigationBarTitleDisplayMode(.inline)
		.navigationBarBackButtonHidden(true)
		.toolbar {
			ToolbarItem(placement: .topBarLeading) {
				Button {
					self.presentationMode.wrappedValue.dismiss()
				} label: {
					 Image(systemName: "chevron.left")
						.aspectRatio(contentMode: .fit)
				}
			}
			ToolbarItem(placement: .principal) {
				Text(localName)
					.fontWeight(.semibold)
					.foregroundStyle(Color.darkBrown)
			}
		}
    }
}

//#Preview {
//    MapToRecordListView(recordList: UserData.mangjaeData.recordList, localName: "서울특별시")
//}

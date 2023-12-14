//
//  ShelfRecordListView.swift
//  Moment
//
//  Created by 홍세희 on 2023/12/12.
//

import SwiftUI
import SwiftData

struct ShelfRecordListView: View {
	@Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
	// SwiftData Query
	@Query var bookList: [MomentBook]
	@Query var recordList: [MomentRecord]
	
    let bookISBN: String
	var bookRecordList: [MomentRecord] {
		recordList.filter { $0.bookISBN == self.bookISBN }
	}
	var recordYearList: [Int] {
		Set(bookRecordList.map { $0.year }).sorted { $0 > $1 }
	}
	var bookData: MomentBook? {
		bookList.first { $0.bookISBN == bookISBN }
	}
	
	@State var showDialog = false
    
    var body: some View {
		ZStack {
			ScrollView {
				ForEach(recordYearList, id: \.self) { year in
					let bookRecordList = bookRecordList.filter { $0.year == year }
					VStack(alignment: .leading, spacing: -20) {
						RecordYearView(year: year)
							.padding(20)
						ForEach(bookRecordList, id: \.id) { record in
							CustomListDivider()
							NavigationLink {
								RecordDetailView(recordID: record.id)
								Text("")
							} label: {
								ShelfRecordCellView(recordId: record.id)
							}
							
						}
					}
				}
			}
			if showDialog {
				if let bookData = bookData {
					BookInfodialog(isActive: $showDialog, bookInfo: bookData)
				}
			}
		}
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
				if let bookData = bookData {
					Text(bookData.title)
						.fontWeight(.semibold)
						.foregroundStyle(Color.darkBrown)
						.lineLimit(1)
				}
			}
			ToolbarItem(placement: .topBarTrailing) {
				Button {
					showDialog = true
				} label: {
					 Image(systemName: "info.circle")
						.aspectRatio(contentMode: .fit)
				}
			}
		}
    }
}

#Preview {
    ShelfRecordListView(bookISBN: "1")
}

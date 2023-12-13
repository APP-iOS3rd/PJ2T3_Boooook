//
//  ShelfRecordListView.swift
//  Moment
//
//  Created by 홍세희 on 2023/12/12.
//

import SwiftUI

struct ShelfRecordListView: View {
	@Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
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
							} label: {
								ShelfRecordCellView(recordId: record.id)
							}
							
						}
					}
				}
			}
			if showDialog {
				BookInfodialog(isActive: $showDialog)
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
				Text(bookTitle)
					.fontWeight(.semibold)
					.foregroundStyle(Color.darkBrown)
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

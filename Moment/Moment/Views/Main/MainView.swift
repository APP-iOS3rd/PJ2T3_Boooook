//
//  MainView.swift
//  Moment
//
//  Created by phang on 12/13/23.
//

import SwiftUI
import SwiftData

struct MainView: View {
	@Query var bookList: [MomentBook]
	@Query var recordList: [MomentRecord]
	
	@State var selectedOption = 0 // 세그먼트 인덱스 저장 프로퍼티
	@State var recordSearchText = "" // 기록 검색 텍스트 저장 프로퍼티
	@State var isTapSearchButton = false // 검색 버튼탭 여부 저장 프로퍼티
	
	@State var mainBookList: [MomentBook] = []
	@State var mainRecordList: [MomentRecord] = []
	
	@FocusState var isSearchFocused: Bool

	var body: some View {
		NavigationStack {
			VStack(spacing: 0) {
				if selectedOption == 0 {
					VStack(spacing: 20) {
						SearchBar(searchText: $recordSearchText,
								  isTapButton: $isTapSearchButton,
								  isSearchFocused: _isSearchFocused)
						.padding(.horizontal)
						SegmentBar(preselectedIndex: $selectedOption)
						MainShelfView(bookList: $mainBookList)
					}
				} else if selectedOption == 1 {
					ZStack(alignment: .top) {
						MainMapView(recordList: $mainRecordList)
						VStack(spacing: 20) {
							SearchBar(searchText: $recordSearchText,
									  isTapButton: $isTapSearchButton,
									  isSearchFocused: _isSearchFocused)
							.padding(.horizontal)
							SegmentBar(preselectedIndex: $selectedOption)
						}
					}
				}
			}
			.onChange(of: isTapSearchButton) {
				if isTapSearchButton && !recordSearchText.isEmpty {
					mainRecordList = recordSearch(bookSearch: bookSearch)
				}
			}
			.onChange(of: recordSearchText) {
				if !isSearchFocused && recordSearchText.isEmpty {
					mainRecordList = recordList
					mainBookList = bookList
				}
			}
			.onChange(of: recordList) {
				mainBookList = bookList
				mainRecordList = recordList
			}
		}
		.tint(.darkBrown)
		.onAppear {
			mainBookList = bookList
			mainRecordList = recordList
		}
	}
	
	func recordSearch(bookSearch: () -> [MomentBook]) -> [MomentRecord] {
		self.mainBookList = bookSearch()
		let result = self.mainBookList.reduce(into: [MomentRecord]()) { recordList, book in
			recordList += self.recordList.filter { $0.bookISBN == book.bookISBN }
		}
		isTapSearchButton = false
		return result
	}
	
	func bookSearch() -> [MomentBook] {
		let result = bookList
			.filter { $0.title.localizedStandardContains(recordSearchText) }
		return result
	}
}

#Preview {
	MainView()
}


//
//  MainView.swift
//  Moment
//
//  Created by phang on 12/13/23.
//

import SwiftUI

struct MainView: View {
	@State var selectedOption = 0 // 세그먼트 인덱스 저장 프로퍼티
	@State var recordSearchText = "" // 기록 검색 텍스트 저장 프로퍼티
	@State var isTapSearchButton = false // 검색 버튼탭 여부 저장 프로퍼티
	@State var bookList: [MyBook] = UserData.mangjaeData.bookList
	@State var recordList: [MyRecord] = UserData.mangjaeData.recordList
	@FocusState var isSearchFocused: Bool
    @StateObject var router = Router()
//    @State private var path = NavigationPath()
	var body: some View {
		NavigationStack(path: $router.path) {
			VStack(spacing: 0) {
				if selectedOption == 0 {
					VStack(spacing: 20) {
						SearchBar(searchText: $recordSearchText,
								  isTapButton: $isTapSearchButton,
								  isSearchFocused: _isSearchFocused)
						.padding(.horizontal)
						SegmentBar(preselectedIndex: $selectedOption)
                        MainShelfView(bookList: $bookList, recordSearchText: $recordSearchText, isSearchFocused: _isSearchFocused)
					}
				} else if selectedOption == 1 {
					ZStack(alignment: .top) {
						MainMapView(recordList: $recordList)
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
					recordList = recordSearch(bookSearch: bookSearch)
				}
			}
			.onChange(of: recordSearchText) {
				if !isSearchFocused && recordSearchText.isEmpty {
					recordList = UserData.mangjaeData.recordList
					bookList = UserData.mangjaeData.bookList
				}
			}
//            .navigationBarBackButtonHidden(true)
		}
        .environmentObject(router)
		.tint(.darkBrown)
	}
	
	func recordSearch(bookSearch: () -> [MyBook]) -> [MyRecord] {
		self.bookList = bookSearch()
		let result = self.bookList.reduce(into: [MyRecord]()) { recordList, book in
			recordList += UserData.mangjaeData.recordList.filter { $0.bookISBN == book.bookISBN }
		}
		isTapSearchButton = false
		return result
	}
	
	func bookSearch() -> [MyBook] {
		let result = UserData.mangjaeData.bookList
			.filter { $0.title.contains(recordSearchText) }
		return result
	}
}
//
//#Preview {
//	MainView()
//}


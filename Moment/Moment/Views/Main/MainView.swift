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
	@State var recordSearchText = "" // 기억 검색 텍스트 저장 프로퍼티
	@State var isTapSearchButton = false // 검색 버튼탭 여부 저장 프로퍼티
	
	@State var mainBookList: [MomentBook] = []
	@State var mainRecordList: [MomentRecord] = []
	
	@FocusState var isSearchFocused: Bool
    @StateObject var router = Router()

	var body: some View {
        GeometryReader { geo in
            NavigationStack(path: $router.path) {
                VStack(spacing: 0) {
                    if selectedOption == 0 {
                        VStack(spacing: 20) {
                            SearchBar(searchText: $recordSearchText,
                                      isTapButton: $isTapSearchButton,
                                      isSearchFocused: _isSearchFocused)
                            .padding(.horizontal, 20)
                            SegmentBar(preselectedIndex: $selectedOption, geo: geo)
                            
                            MainShelfView(bookList: $mainBookList, recordSearchText: $recordSearchText, isSearchFocused: _isSearchFocused, geo: geo)
                        }
                    } else if selectedOption == 1 {
                        ZStack(alignment: .top) {
                            MainMapView(recordList: $mainRecordList)
                            VStack(spacing: 20) {
                                SearchBar(searchText: $recordSearchText,
                                          isTapButton: $isTapSearchButton,
                                          isSearchFocused: _isSearchFocused)
                                .padding(.horizontal, 20)
                                SegmentBar(preselectedIndex: $selectedOption, geo: geo)
                            }
                        }
                    }
                }
                //MARK: [추후 업데이트] 문제3 수정
//                .onDisappear(perform: {
//                    recordSearchText = ""
//                })
                .onChange(of: isTapSearchButton) {
                    if isTapSearchButton && !recordSearchText.isEmpty {
                        mainRecordList = recordSearch(bookSearch: bookSearch)
                    }
                    isTapSearchButton = false
                }
                .onChange(of: recordSearchText) {
                    if recordSearchText.isEmpty {
                        mainRecordList = recordList
                        mainBookList = bookList
                    }
                }
                .onChange(of: recordList) {
                    mainBookList = bookList
                    mainRecordList = recordList
                }
                .navigationBarBackButtonHidden(true)
            }
            .environmentObject(router)
            .tint(.darkBrown)
            .onAppear {
                mainBookList = bookList
                mainRecordList = recordList
            }
            .onTapGesture {
                hideKeyboard()
            }
        }
	}
	
	func recordSearch(bookSearch: () -> [MomentBook]) -> [MomentRecord] {
		self.mainBookList = bookSearch()
		let result = self.mainBookList.reduce(into: [MomentRecord]()) { recordList, book in
			recordList += self.recordList.filter { $0.bookISBN == book.bookISBN }
		}
		return result
	}
	
	func bookSearch() -> [MomentBook] {
		let result = bookList
			.filter { $0.title.localizedStandardContains(recordSearchText) }
		return result
	}
}

//#Preview {
//	MainView()
//}


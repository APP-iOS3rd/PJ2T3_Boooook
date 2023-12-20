//
//  SelectedBookListView.swift
//  Moment
//
//  Created by 홍세희 on 2023/12/12.
//

import SwiftUI
import SwiftData

struct SelectedBooktoAPIView: View {
	@Environment(\.dismiss) private var dismiss
	@EnvironmentObject var router: Router
	
	@StateObject var network = BookAPI.shared
	
	// 기억된 책 리스트 이름순으로 정렬해서 쿼리 가져오는 프로퍼티
	@Query(sort: \MomentBook.title) var bookList: [MomentBook]
//	@Query var bookList: [MomentBook]
	
	@State private var searchResults: [Book] = []
	@State private var searchBookText = ""
	@State var showBool = false
	@State var noResults = false
    @State var isRecord = false
	
	var body: some View {
		VStack(spacing: -30) {
			BookApiSearchBar(searchBookText: $searchBookText, searchResults: $searchResults, showBool: $showBool, noResults: $noResults)
				.padding(20)
			VStack(alignment: .leading, spacing: -30) {
				if searchBookText == "" {
                    Text(bookList.count == 0 ? "" : "기억에 남겨진 책")
						.font(Font.semibold18)
						.padding(30)
					VStack {
						ScrollView {
							VStack(alignment: .leading, spacing: -30) {
								ForEach(bookList, id: \.self) { book in
									NavigationLink{
										AddRecordView(isRecord: $isRecord, bookInfo: book)
									} label: {
										SelectedBookCell(bookInfo: book)
									}
									CustomListDivider()
								}
							}
						}
					}
				} else {
					if !noResults {
						Text("책 검색 결과")
							.font(Font.semibold18)
							.opacity(showBool ? 1.0 : 0.0)
							.padding(30)
					} else {
						VStack {
							Spacer()
							Text("책 검색 결과가 없어요.")
								.font(Font.semibold18)
								.foregroundStyle(Color.lightBrown)
								.opacity(showBool ? 1.0 : 0.0)
								.padding(30)
						}
					}
					VStack {
						ScrollView {
							VStack(alignment: .leading, spacing: -30) {
								ForEach(searchResults, id: \.self) { book in
									NavigationLink {
                                        AddRecordView(isRecord: $isRecord, bookInfo: book)
									} label: {
										SelectedBookCell(bookInfo: book)
									}
									CustomListDivider()
								}
							}
						}
					}
				}
			}
		}
        .onChange(of: isRecord) {
            if isRecord {
                searchBookText = ""
                isRecord = false
            }
        }
		.onChange(of: searchBookText) {
			if searchBookText.isEmpty {
				searchResults = []
				showBool = false
			}
		}
		.navigationBarBackButtonHidden(true)
		.toolbar {
			ToolbarItem(placement: .topBarLeading) {
				Button {
					dismiss()
				} label: {
					Image(systemName: "chevron.left")
						.aspectRatio(contentMode: .fit)
				}
			}
			ToolbarItem(placement: .principal) {
				Text("기억하고 싶은 책 선택하기")
					.fontWeight(.semibold)
					.foregroundStyle(Color.darkBrown)
			}
		}
	}
}

//#Preview {
//    SelectedBooktoAPIView()
//}


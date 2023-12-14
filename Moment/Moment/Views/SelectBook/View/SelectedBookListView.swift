//
//  SelectedBookListView.swift
//  Moment
//
//  Created by 홍세희 on 2023/12/12.
//

import SwiftUI

protocol SelectedBook {
	var title: String { get }
	var theCoverOfBook: String { get }
	var author: String { get }
	var publisher: String { get }
	var plot: String { get }
	var bookISBN: String { get }
}

struct BookList: Decodable {
	let total: Int
	let start: Int
	let display: Int
	let items: [Book]
}

struct Book: Codable, Hashable, SelectedBook {
	let title: String
	let theCoverOfBook: String
	let author: String
	let publisher: String
	let plot: String
	let bookISBN: String
	
	enum CodingKeys: String, CodingKey {
		case theCoverOfBook = "image"
		case plot = "description"
		case bookISBN = "isbn"
		case title
		case author
		case publisher
	}
}
struct SelectedBooktoAPIView: View {

    @Environment(\.dismiss) private var dismiss
	@StateObject var network = BookAPI.shared
	@State private var searchResults: [Book] = []
	@State private var searchBookText = ""
	@State var showBool = false
	@State var noResults = false
    @EnvironmentObject var router: Router
	var body: some View {
		VStack(spacing: -30) {
			BookApiSearchBar(searchBookText: $searchBookText, searchResults: $searchResults, showBool: $showBool, noResults: $noResults)
				.padding(20)
			VStack(alignment: .leading, spacing: -30) {
				if searchBookText == "" {
					Text("기록된 책 목록")
						.font(Font.semibold18)
						.padding(30)
					VStack {
						ScrollView {
							VStack(alignment: .leading, spacing: -30) {
								ForEach(UserData.mangjaeData.bookList, id: \.self) { book in
                                    NavigationLink(destination: AddRecordView(bookInfo: book)) {
										SelectedBookDummyCell(bookInfo: book)
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
                                    NavigationLink(destination: AddRecordView(bookInfo: book)) {
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
				Text("기록할 책 선택하기")
					.fontWeight(.semibold)
					.foregroundStyle(Color.darkBrown)
			}
		}
	}
}

//#Preview {
//	SelectedBooktoAPIView()
//}

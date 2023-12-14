//
//  SelectedBookListView.swift
//  Moment
//
//  Created by 홍세희 on 2023/12/12.
//

import SwiftUI
import SwiftData

struct SelectedBooktoAPIView: View {
	@Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
	@StateObject var network = BookAPI.shared
	
	@Query var bookList: [MomentBook]
	
	@State private var searchResults: [Book] = []
	@State private var searchBookText = ""
	@State var showBool = false
	@State var noResults = false
	
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
								ForEach(bookList, id: \.self) { book in
                                    NavigationLink{
                                        AddRecordView(bookInfo: book)
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
                                        AddRecordView(bookInfo: book)
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
				Text("기록할 책 선택하기")
					.fontWeight(.semibold)
					.foregroundStyle(Color.darkBrown)
			}
		}
	}
}

#Preview {
	SelectedBooktoAPIView()
}

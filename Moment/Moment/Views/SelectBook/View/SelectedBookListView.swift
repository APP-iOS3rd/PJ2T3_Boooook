//
//  SelectedBookListView.swift
//  Moment
//
//  Created by 홍세희 on 2023/12/12.
//

import SwiftUI

struct BookList: Decodable {
    let total: Int
    let start: Int
    let display: Int
    let items: [Book]
}

struct Book: Codable, Hashable {
    let title: String
    let image: String
    let author: String
    let publisher: String
    let description: String
}
struct SelectedBooktoAPIView: View {
    @StateObject var network = BookAPI.shared
    @State private var searchResults: [Book] = []
    @State private var searchBookText = ""
    @State var showBool = false
    @State var noResults = false
    
    var body: some View {
        NavigationStack {
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
                                    ForEach(bookInfo) { bookInfo in
                                        NavigationLink(destination: Text("test")) {
                                            SelectedBookDummyCell(bookInfo: bookInfo)
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
                                    ForEach(searchResults, id: \.self) { bookInfo in
                                        NavigationLink(destination: Text("태스트용")) {
                                            SelectedBookCell(bookInfo: bookInfo)
                                        }
                                        CustomListDivider()
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
    }
}

#Preview {
    SelectedBooktoAPIView()
}

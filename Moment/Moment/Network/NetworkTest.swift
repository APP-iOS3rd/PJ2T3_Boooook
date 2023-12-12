//
//  NetworkTest.swift
//  Moment
//
//  Created by phang on 12/11/23.
//
import SwiftUI

struct NetworkTest: View {
    @StateObject var network = BookAPI.shared
    @State private var searchResults: [Book] = []
//    @State private var searchBookText = ""

    var body: some View {
        VStack {
//            SearchBar(searchBookText: $searchBookText)
            SearchBar()
            List(searchResults, id: \.self) { book in
                VStack(alignment: .leading) {
                    Text(book.title)
                        .font(.headline)
                    Text(book.author)
                        .font(.subheadline)
                        .foregroundColor(.gray)
                }
            }
        }
        .padding()
        .onAppear() {
            searchBooks()
        }
    }

    private func searchBooks() {
        Task {
            do {
                searchResults = try await network.fetchData(queryValue: "미움")
            } catch let error as NetworkError {
                print("Network error: \(error.errorMessage)")
            } catch {
                print("Unexpected error: \(error.localizedDescription)")
            }
        }
    }
}

#Preview {
    NetworkTest()
}

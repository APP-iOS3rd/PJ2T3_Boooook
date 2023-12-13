//
//  BookApiSearchBar.swift
//  Moment
//
//  Created by 홍세희 on 2023/12/13.
//

import SwiftUI

struct BookApiSearchBar: View {
    @Binding var searchBookText: String
    @StateObject var network = BookAPI.shared
    @Binding var searchResults: [Book]
    @Binding var showBool: Bool
    @Binding var noResults: Bool
    
    var body: some View {
        HStack(alignment: .center, spacing: 0) {
            Image(systemName: "magnifyingglass")
                .foregroundStyle(Color.secondary)
                .padding(.leading)
            
            Spacer()
            TextField("책 제목", text: $searchBookText)
                .textInputAutocapitalization(.never)
            
            if !searchBookText.isEmpty {
                Button(action: {
                    searchBookText = ""
                }, label: {
                    Image(systemName: "xmark.circle")
                        .foregroundStyle(.darkBrown)
                })
                .padding(.horizontal, 10)
            }
            
            Button(action: searchBooks) {
                Text("검색")
                    .frame(width: 100,height: 40)
                    .background(Color.mainBrown)
                    .foregroundColor(Color.white)
                    .clipShape(.rect(bottomTrailingRadius: 10, topTrailingRadius: 10))
            }
        }
        .frame(height: 40, alignment: .leading)
        .background(.white)
        .cornerRadius(10)
        .overlay(
            RoundedRectangle(cornerRadius: 15)
                .stroke(Color.mainBrown, lineWidth: 2)
        )
        
    }
    private func searchBooks() {
        Task {
            do {
                searchResults = try await network.fetchData(queryValue: searchBookText)
                showBool = true
                noResults = searchResults.isEmpty
            } catch let error as NetworkError {
                print("Network error: \(error.errorMessage)")
                showBool = false
                noResults = true
            } catch {
                print("Unexpected error: \(error.localizedDescription)")
                showBool = false
                noResults = true
            }
        }
    }
}

//struct BookApiSearchBar_Previews: PreviewProvider {
//    @State static var results: [Book] = []
//
//    static var previews: some View {
//        BookApiSearchBar()
//    }
//}


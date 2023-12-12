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
    @State private var searchBookText = ""
    
    var body: some View {
        VStack {
            
            SearchBar(searchBookText: searchBookText, searchResults: $searchResults)
            
            List(searchResults, id: \.self) { book in
                
                HStack {
                    Image(book.image)
                        .resizable()
                        .frame(width: 50, height: 50)
                    VStack(alignment: .leading) {
                        
                        Text(book.title)
                            .font(.headline)
                        Text(book.author)
                            .font(.subheadline)
                            .foregroundColor(.gray)
                    }
                }
            }
        }
        .padding()
    }
    
    private func searchBooks() {
        Task {
            do {
                searchResults = try await network.fetchData(queryValue: searchBookText)
            } catch let error as NetworkError {
                print("Network error: \(error.errorMessage)")
            } catch {
                print("Unexpected error: \(error.localizedDescription)")
            }
        }
    }
}

struct NetworkTest_Previews: PreviewProvider {
    static var previews: some View {
        NetworkTest()
    }
}

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
            
            BookApiSearchBar(searchBookText: searchBookText, searchResults: $searchResults)
            
            List(searchResults, id: \.self) { book in
                
                
                HStack {
                    fetchImage(url: book.image)
                    
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
    func fetchImage(url: String) -> some View {
        AsyncImage(url: URL(string: url)) { image in
            image.resizable()
        } placeholder: {
            ProgressView()
        }
        .frame(width: 75, height: 105)
    }
}

struct NetworkTest_Previews: PreviewProvider {
    static var previews: some View {
        NetworkTest()
    }
}

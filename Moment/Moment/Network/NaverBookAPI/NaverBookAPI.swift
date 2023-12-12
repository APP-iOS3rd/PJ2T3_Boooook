//
//  NaverBookAPI.swift
//  Moment
//
//  Created by 홍세희 on 2023/12/12.
//

import SwiftUI

struct BookList: Codable {
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

class BookAPI: ObservableObject {
    static let shared = BookAPI()
    private init() { }
    //@Published var posts = [Atricle]()
    
    private var clientID: String? {
        get {
            Bundle.main.bookID
        }
    }
    
    private var clientSecret: String? {
        get {
            Bundle.main.bookSECRET
        }
    }

    func fetchData(queryValue: String) async {
        guard let clientID = clientID else { return }
        guard let clientSecret = clientSecret else { return }

        let urlString = "https://openapi.naver.com/v1/search/book.json?query=\(queryValue)"
        
        guard let queryURL = URL(string: urlString) else { return }
        
        var request = URLRequest(url: queryURL)
        
        request.httpMethod = "GET"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue(clientID, forHTTPHeaderField: "X-Naver-Client-Id")
        request.addValue(clientSecret, forHTTPHeaderField: "X-Naver-Client-Secret")
        
        do {
            let (data, response) = try await URLSession.shared.data(for: request)
            
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                print("Error: Invalid response from server.")
                return
            }

            let str = String(decoding: data, as: UTF8.self)
            print(str)
            
        } catch {
            print("Error: \(error.localizedDescription)")
        }
    }
}

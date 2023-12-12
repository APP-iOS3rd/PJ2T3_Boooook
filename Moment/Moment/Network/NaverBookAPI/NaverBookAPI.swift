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

    func fetchData(queryValue: String) {
        guard let clientID = clientID else { return }
        guard let clientSecret = clientSecret else { return }

        let urlString = "https://openapi.naver.com/v1/search/book.json?query=\(queryValue)"
        
        guard let queryURL = URL(string: urlString) else { return }
        
        let session = URLSession(configuration: .default)
        var request = URLRequest(url: queryURL)
        
        request.httpMethod = "GET"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue(clientID, forHTTPHeaderField: "X-Naver-Client-Id")
        request.addValue(clientSecret, forHTTPHeaderField: "X-Naver-Client-Secret")
        
        //MARK: 어싱크 어웨잇으로
        let task = session.dataTask(with: request) { data, response, error in
            if let error = error {
                print(error.localizedDescription)
                return
            }

            guard let response = response as? HTTPURLResponse else {
                // 정상적으로 값이 오지 않았을 때 처리
                print("1")
                return
            }
            
            guard response.statusCode == 200 else {
                print("\(response.statusCode)")
                return
            }

            guard let data = data else {
                print("No data received")
                return
            }

            let str = String(decoding: data, as: UTF8.self)
            print(str)
//            do {
//                let json = try JSONDecoder().decode(Results.self, from: data)
//                print(json.weather.count)
//                DispatchQueue.main.async {
//                    self.weatherREsults = json
//                    self.posts = json.weather
//                }
//            } catch let error {
//                print(error.localizedDescription)
//            }
        }
        task.resume()
        }
}


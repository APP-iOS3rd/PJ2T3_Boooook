import SwiftUI

//struct BookList: Decodable {
//    let total: Int
//    let start: Int
//    let display: Int
//    let items: [Book]
//}
//
//struct Book: Codable, Hashable {
//    let title: String
//    let image: String
//    let author: String
//    let publisher: String
//    let description: String
//}

class BookAPI: ObservableObject {
    static let shared = BookAPI()
    private init() { }
    
    func fetchData(queryValue: String) async throws -> [Book] {
        let clientID = Bundle.main.bookID
        let clientSecret = Bundle.main.bookSECRET
            
        let urlString = "https://openapi.naver.com/v1/search/book.json?query=\(queryValue)"
        
        guard let queryURL = URL(string: urlString) else {
            throw NetworkError.invalidURL
        }
        
        
        var request = URLRequest(url: queryURL)
        request.httpMethod = "GET"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue(clientID, forHTTPHeaderField: "X-Naver-Client-Id")
        request.addValue(clientSecret, forHTTPHeaderField: "X-Naver-Client-Secret")
        
        do {
            let (data, response) = try await URLSession.shared.data(for: request)
            
            guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
                throw NetworkError.invalidResponse
            }

            let json = try JSONDecoder().decode(BookList.self, from: data)
            return json.items
        } catch {
            throw NetworkError.invalidData
        }
    }
}

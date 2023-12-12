//
//  NetworkErrorCase.swift
//  Moment
//
//  Created by 백대홍 on 12/12/23.
//

enum NetworkError: Error {
    case invalidURL
    case badConnection
    case invalidResponse
    case invalidData
    
    var errorMessage: String {
        switch self {
        case .invalidURL:
            return "This is not correct url"
        case .badConnection:
            return "We got some error. check the internet."
        case .invalidResponse:
            return "Invaild response"
        case .invalidData:
            return "The data recived is wrong."
        }
    }
}

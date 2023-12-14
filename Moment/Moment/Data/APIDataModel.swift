//
//  APIDataModel.swift
//  Moment
//
//  Created by Minjae Kim on 12/14/23.
//

import Foundation

protocol SelectedBook {
	var title: String { get }
	var theCoverOfBook: String { get }
	var author: String { get }
	var publisher: String { get }
	var plot: String { get }
	var bookISBN: String { get }
}

struct BookList: Decodable {
	let total: Int
	let start: Int
	let display: Int
	let items: [Book]
}

struct Book: Codable, Hashable, SelectedBook {
	let title: String
	let theCoverOfBook: String
	let author: String
	let publisher: String
	let plot: String
	let bookISBN: String
	
	enum CodingKeys: String, CodingKey {
		case theCoverOfBook = "image"
		case plot = "description"
		case bookISBN = "isbn"
		case title
		case author
		case publisher
	}
}

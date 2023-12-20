//
//  SwiftDataModel.swift
//  Moment
//
//  Created by Minjae Kim on 12/14/23.
//

import Foundation
import SwiftData

@Model
class MomentRecord: Identifiable {
	@Attribute(.unique) var id = UUID()
	var latitude: Double
	var longitude: Double
	var localName: String
	var myLocation: String
	var year: Int // 숫자
	var monthAndDay: String // "0000"
	var time: String // "0000"
	var paragraph: String
	var page: Int
	var commentary: String
	var photos: [Data]
	var bookISBN: String
	
	init(latitude: Double, longitude: Double, localName: String, myLocation: String, year: Int, monthAndDay: String, time: String, paragraph: String, page: Int, commentary: String, photos: [Data], bookISBN: String) {
		self.latitude = latitude
		self.longitude = longitude
		self.localName = localName
		self.myLocation = myLocation
		self.year = year
		self.monthAndDay = monthAndDay
		self.time = time
		self.paragraph = paragraph
		self.page = page
		self.commentary = commentary
		self.photos = photos
		self.bookISBN = bookISBN
	}
}

@Model
class MomentBook: SelectedBook, Hashable {
	var bookISBN: String
	var theCoverOfBook: String
	var title: String
	var author: String
	var publisher: String
	var plot: String
	
	init(bookISBN: String, theCoverOfBook: String, title: String, author: String, publisher: String, plot: String) {
		self.bookISBN = bookISBN
		self.theCoverOfBook = theCoverOfBook
		self.title = title
		self.author = author
		self.publisher = publisher
		self.plot = plot
	}
}

extension MomentBook {
    static func == (lhs: MomentBook, rhs: MomentBook) -> Bool {
        return lhs.bookISBN == rhs.bookISBN
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(bookISBN)
    }
}

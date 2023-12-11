//
//  RecordData.swift
//  Moment
//
//  Created by phang on 12/11/23.
//

import Foundation

// MARK: - Record
struct RecordData: Identifiable {
    var id = UUID()
    var coordinate: String
    var location: String
    var dateTime: Date
    var paragraph: String
    var page: Int
    var commentary: String
    var photos: [ImageData]
    var bookISBN: String

    static let recordDummyData = RecordData(coordinate: "??", location: "그 때 그 반포한강공원",
                                            dateTime: Date(), paragraph: "“새로운 것이 들어오면 이미 갖고 있는 것들과 충돌을 시도해라”",
                                            page: 48, commentary: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
                                            photos: ImageData.imageDummyData, bookISBN: "0000")
}

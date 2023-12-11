//
//  BookData.swift
//  Moment
//
//  Created by 정인선 on 12/11/23.
//

import Foundation

// MARK: - Book Data
struct BookData: Identifiable {
    let id = UUID()
    let title: String
    let image: String
    let author: String
    
    static let bookDummyData: BookData = BookData(title: "세이노의 가르침", image: "dummyBookImage01", author: "세이노")
}

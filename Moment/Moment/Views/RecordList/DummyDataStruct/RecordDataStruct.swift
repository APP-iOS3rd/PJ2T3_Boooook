//
//  RecordDataStruct.swift
//  Moment
//
//  Created by 홍세희 on 2023/12/11.
//

import Foundation
//bookdata: DataStruct(date: testDate, image: "roofi", contents: "줄거리입니다.. 예.. 트렌드 코리아..")
struct RecordDataStruct: Identifiable {
    var id = UUID()
    var date: Date
    var image: String
    var contents: String
    
    func changeDayToString() -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "MM월 dd일"
        let changeDateFormatting = formatter.string(from: date)
        
        return changeDateFormatting
    }
    
    func changeYearToString() -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "YYYY"
        let changeDateFormatting = formatter.string(from: date)
        
        return changeDateFormatting
    }
    
    func changeTimeToString() -> String {
        var returnString: String
        let formatter = DateFormatter()
        formatter.dateFormat = "H"
        let changeDivideFormatting = formatter.string(from: date)
        
        switch Int(changeDivideFormatting) ?? 0 {
        case 0...5: returnString = "새벽"
        case 6...11: returnString = "아침"
        case 12...16: returnString = "낮"
        case 17...23: returnString = "밤"
        default: returnString = "새벽"
        }
        return returnString
    }
}

struct BookInfoStruct: Identifiable {
    var id = UUID()
    var image: String
    var title: String
    var author: String
    var publisher: String
    //var publishYear: String
    
    
}

let testDate = Date()

var bookData: [RecordDataStruct] = [
    RecordDataStruct(date: testDate, image: "roofi", contents: "줄거리입니다.. 예.. 트렌드 코리아.."),
    RecordDataStruct(date: testDate, image: "roofi", contents: "줄거리입니다.. 예.. 트렌드 코리아.."),
    RecordDataStruct(date: testDate, image: "roofi", contents: "새로운 것이 들어오면 이미 갖고 있는 것들과 충돌을 시도해라"),
]

var bookInfo: [BookInfoStruct] = [
    BookInfoStruct(image: "bookex1", title: "마흔에 읽는 쇼펜하우어", author: "강용수 (지은이)", publisher: "유노북스"),
    BookInfoStruct(image: "bookex1", title: "마흔에 읽는 쇼펜하우어 마흔에 읽는 쇼펜하우어 마흔에 읽는 쇼펜하우어", author: "강용수 (지은이)", publisher: "유노북스"),
    BookInfoStruct(image: "bookex1", title: "마흔에 읽는 쇼펜하우어 마흔에 읽는 쇼펜하우어 마흔에 읽는 쇼펜하우어dffdfdfdfdf", author: "강용수 (지은이)", publisher: "유노북스"),
]

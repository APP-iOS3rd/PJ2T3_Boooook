//
//  FormattedTime.swift
//  Moment
//
//  Created by phang on 12/19/23.
//

import Foundation

struct FormattedTime {
    var date: Date
    
    func formattedYearToInt() -> Int {
        let formatter = DateFormatter()
        formatter.dateFormat = "YYYY"
        let changeDateFormatting = formatter.string(from: date)
        return Int(changeDateFormatting) ?? 2023
    }
    
    func formattedDayToString() -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "MM월 dd일"
        let changeDateFormatting = formatter.string(from: date)
        return changeDateFormatting
    }
    
    func formattedTimeToString() -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "HHmm"
        let changeDivideFormatting = formatter.string(from: date)
        return changeDivideFormatting
    }
}

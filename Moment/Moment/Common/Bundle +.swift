//
//  Bundle +.swift
//  Moment
//
//  Created by phang on 12/11/23.
//

import Foundation

// MARK: - API KEY
extension Bundle {
    var bookID: String {
        getAPI("APIKEY", "ID")
    }
    var bookSECRET: String {
        getAPI("APIKEY", "SECRET")
    }
    func getAPI(_ fileName: String, _ key: String) -> String {
        guard let file = self.path(forResource: fileName, ofType: "plist") else {
            fatalError("\(fileName).plist 를 찾지 못했습니다.")
        }
        guard let resource = NSDictionary(contentsOfFile: file) else { return "" }
        guard let result = resource[key] as? String else {
            fatalError("\(fileName).plist 에 \(key) 를 입력해주세요.")
        }
        return result
    }
}

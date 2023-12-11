//
//  ImageDummyData.swift
//  Moment
//
//  Created by phang on 12/11/23.
//

import SwiftUI

// MARK: - Photo
struct ImageData: Identifiable {
    let id = UUID()
    let imageString: String
    
    static let imageDummyData: [ImageData] = [
        ImageData(imageString: "dummyEx01"),
        ImageData(imageString: "dummyEx02"),
        ImageData(imageString: "dummyEx03")
    ]
}

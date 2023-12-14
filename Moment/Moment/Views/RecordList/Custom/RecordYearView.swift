//
//  RecordYearView.swift
//  Moment
//
//  Created by phang on 12/13/23.
//

import SwiftUI

struct RecordYearView: View {
    let year: Int
    
    var body: some View {
        Text(String(year))
            .foregroundColor(Color.mainBrown)
            .multilineTextAlignment(.leading)
            .padding(.horizontal, 10)
            .background(Color.offBrown)
            .cornerRadius(10)
            .fixedSize(horizontal: false, vertical: false)
    }
}

struct RecordBookTitleView: View {
    let title: String
    
    var body: some View {
        Text(title)
            .foregroundColor(Color.mainBrown)
            .multilineTextAlignment(.leading)
            .padding(.horizontal, 10)
            .background(Color.offBrown)
            .cornerRadius(10)
            .fixedSize(horizontal: false, vertical: false)
			.lineLimit(1)
    }
}

#Preview {
    RecordYearView(year: 2023)
}

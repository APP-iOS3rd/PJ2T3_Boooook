//
//  RecordBookTitleView.swift
//  Moment
//
//  Created by 정인선 on 12/19/23.
//

import SwiftUI

struct RecordBookTitleView: View {
    let title: String
    
    var body: some View {
        Text(title)
            .foregroundColor(Color.mainBrown)
            .multilineTextAlignment(.leading)
            .padding(EdgeInsets(top: 3, leading: 10, bottom: 3, trailing: 10))
            .background(Color.offBrown)
            .cornerRadius(10)
            .fixedSize(horizontal: false, vertical: false)
            .lineLimit(1)
    }
}
#Preview {
    RecordBookTitleView(title: "책제목")
}

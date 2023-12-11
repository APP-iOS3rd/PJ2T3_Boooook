//
//  NoContentView.swift
//  Moment
//
//  Created by 백대홍 on 12/11/23.
//

import SwiftUI

struct NoContentView: View {
    var body: some View {
        VStack {
            Spacer().frame(height: 250)
            Text("책장에 등록된 책이 없습니다...\n책 기록을 시작해보세요.")
                .font(Font.medium18)
                .foregroundStyle(Color.lightBrown)
                .multilineTextAlignment(.center)
            Spacer().frame(height: 200)
        }
    }
}

#Preview {
    NoContentView()
}

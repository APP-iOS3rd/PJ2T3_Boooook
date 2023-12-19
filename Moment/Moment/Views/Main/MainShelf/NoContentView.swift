//
//  NoContentView.swift
//  Moment
//
//  Created by 백대홍 on 12/12/23.
//

import SwiftUI

struct NoContentView: View {
    var body: some View {
        VStack {
            Text("책장이 비어있어요.\n 기억 속에 책을 남겨보세요.")
                .font(Font.medium18)
                .foregroundStyle(Color.lightBrown)
                .multilineTextAlignment(.center)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}

#Preview {
    NoContentView()
}


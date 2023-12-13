//
//  MainShelfView.swift
//  Moment
//
//  Created by 백대홍 on 12/12/23.
//

import SwiftUI

struct MainShelfView: View {
	@Binding var bookList: [MyBook]
    
    var body: some View {
        ZStack(alignment: .bottomTrailing) {
			if bookList.isEmpty {
                NoContentView()
                    .padding()
            } else {
                ScrollView(.vertical, showsIndicators: false) {
                    ContentShelfView(bookList: $bookList)
                }
            }
            Button {
                // Just Design example
            } label: {
                Image(systemName: "plus")
                    .font(.system(size: 30))
                    .fontWeight(.medium)
            }
            .buttonStyle(.circled(color: .lightBrown, size: 30))
            .padding([.bottom, .trailing], 30)
        }
        .ignoresSafeArea()
    }
}

#Preview {
	MainShelfView(bookList: .constant(UserData.mangjaeData.bookList))
}

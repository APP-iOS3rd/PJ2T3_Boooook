//
//  ContentShelfView.swift
//  Moment
//
//  Created by 백대홍 on 12/12/23.
//

import SwiftUI

struct ContentShelfView: View {
	@Binding var bookList: [MyBook]
	@State private var columns = Array(repeating: GridItem(.flexible(), spacing: 20), count: 2)
    @State private var showShelfToList: Bool = false
    @State var bookISBN: String = ""
    
	var body: some View {
		ScrollView {
			LazyVGrid(columns: columns, spacing: 60) {
				ForEach(bookList, id: \.self) { book in
					ZStack {
						Button(action: {
                            bookISBN = book.bookISBN
                            showShelfToList = true
						}, label: {
							Image(book.theCoverOfBook)
								.resizable()
								.frame(width: 130, height: 170)
						})
						CustomShelf()
							.fill(.lightBrown)
							.frame(width: 150, height: 180)
					}
				}
			}
		}
        .navigationDestination(isPresented: $showShelfToList) {
            ShelfRecordListView(bookISBN: bookISBN)
        }
		.padding(.horizontal)
		.padding(.top, 20)
	}
}

#Preview {
	ContentShelfView(bookList: .constant(UserData.mangjaeData.bookList))
}

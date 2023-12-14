//
//  ContentShelfView.swift
//  Moment
//
//  Created by 백대홍 on 12/12/23.
//

import SwiftUI
import SwiftData

struct ContentShelfView: View {
	@State private var columns = Array(repeating: GridItem(.flexible(), spacing: 20), count: 2)
    @State private var showShelfToList: Bool = false
    @State var bookISBN: String = ""
	
	@Binding var bookList: [MomentBook]
    
    let geo: GeometryProxy
    
	var body: some View {
		ScrollView {
			LazyVGrid(columns: columns, spacing: 50) {
				ForEach(bookList, id: \.self) { book in
                    ZStack(alignment: .bottom) {
						Button(action: {
                            bookISBN = book.bookISBN
                            showShelfToList = true
						}, label: {
							fetchImage(url: book.theCoverOfBook)
                                .padding(.bottom, 10)
						})
                        .zIndex(1)
                        
                        CustomShelfUP()
                            .fill(.offBrown)
                            .frame(width: (geo.size.width - 80) / 2)
                            .padding(.bottom, 5)
                        CustomShelfDOWN()
                            .fill(.mainBrown)
                            .frame(width: (geo.size.width - 80) / 2)
                            .shadow(radius: 5, x: 0, y: 1)
					}
                    .padding(.top, 10)
				}
			}
		}
        .navigationDestination(isPresented: $showShelfToList) {
            ShelfRecordListView(bookISBN: bookISBN)
        }
		.padding(.horizontal)
		.padding(.top, 20)
	}
	
	func fetchImage(url: String) -> some View {
		AsyncImage(url: URL(string: url)) { image in
			image
				.resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: (geo.size.width - 140) / 2)
				.shadow(radius: 5, x: 5, y: -2)
		} placeholder: {
			ProgressView()
		}
	}
}

//#Preview {
//	ContentShelfView(bookList: .constant(UserData.mangjaeData.bookList))
//}

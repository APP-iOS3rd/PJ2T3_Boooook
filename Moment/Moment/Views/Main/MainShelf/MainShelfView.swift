//
//  MainShelfView.swift
//  Moment
//
//  Created by 백대홍 on 12/12/23.
//

import SwiftUI
import SwiftData

struct MainShelfView: View {
	@Binding var bookList: [MomentBook]
    @Binding var recordSearchText: String
	
	@State var showShlefListView: Bool = false
	
    @FocusState var isSearchFocused: Bool
    
    let geo: GeometryProxy

    var body: some View {
        ZStack(alignment: .bottomTrailing) {
            if bookList.isEmpty {
                NoContentView()
                    .padding(EdgeInsets(top: 0, leading: 20, bottom: 60, trailing: 20))
            } else {
                ScrollView(.vertical, showsIndicators: false) {
                    ContentShelfView(bookList: $bookList, geo: geo)
                        .padding(.bottom, 40)
                }
            }
            
			Button(action: {
				showShlefListView = true
			}, label: {
				Image(systemName: "plus")
					.font(.system(size: 30))
					.fontWeight(.medium)
			})
			.buttonStyle(.circled(color: .lightBrown, size: 30))
			.padding([.bottom, .trailing], 30)
            .navigationDestination(isPresented: $showShlefListView) {
                SelectedBooktoAPIView()
            }
        }
        .ignoresSafeArea()
    }
}

//#Preview {
//	MainShelfView(bookList: .constant(UserData.mangjaeData.bookList))
//}

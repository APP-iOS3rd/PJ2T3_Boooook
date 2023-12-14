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
                    .padding([.horizontal, .bottom])
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
            .onDisappear {
                // TODO: 서치바에서 검색한 상태에서 add하고 나와서 list 갔다 왔을 때 서치바 텍스트 안 지워짐 ?
//                recordSearchText = ""
//                isSearchFocused = false
            }
        }
        .ignoresSafeArea()
    }
}

//#Preview {
//	MainShelfView(bookList: .constant(UserData.mangjaeData.bookList))
//}

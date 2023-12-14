//
//  MainShelfView.swift
//  Moment
//
//  Created by 백대홍 on 12/12/23.
//

import SwiftUI

struct MainShelfView: View {
    @Binding var bookList: [MyBook]
    @Binding var recordSearchText: String
    @FocusState var isSearchFocused: Bool
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
            NavigationLink(value: Route.SelectedBook) {
                // SelectView 이동
                
                Image(systemName: "plus")
                    .font(.system(size: 30))
                    .fontWeight(.medium)
                
                    .buttonStyle(.circled(color: .lightBrown, size: 30))
                    .padding([.bottom, .trailing], 30)
            }
            .navigationDestination(for: Route.self) { _ in
                SelectedBooktoAPIView()
            }
            .onDisappear {
                recordSearchText = ""
                isSearchFocused = false
            }
        }
        .ignoresSafeArea()
    }
}

//#Preview {
//	MainShelfView(bookList: .constant(UserData.mangjaeData.bookList))
//}

//
//  BookInfoDialog.swift
//  Moment
//
//  Created by phang on 12/11/23.
//

import SwiftUI

// MARK: - Dialog
struct BookInfodialog: View {
    @State private var offset: CGFloat = 1000
    @Binding var isActive: Bool
    let bookInfo: MyBook

    var body: some View {
        ZStack {
            Color.black
                .opacity(0.15)
            VStack(alignment: .leading, spacing: 10) {
                HStack(alignment: .center) {
                    Text(bookInfo.title)
                        .font(.bold20)
                    Spacer()
                    Button {
						withAnimation(.spring()) {
							offset = 1000
						}
						DispatchQueue.main.asyncAfter(deadline: .now() + CATransaction.animationDuration()) {
							isActive = false
						}
                    } label: {
                        Image(systemName: "xmark")
                            .frame(width: 24, height: 24)
                    }
                    .tint(Color.darkBrown)
                }
                Divider()
                    .background(.darkBrown)
                    .frame(height: 1)
                HStack(alignment: .top, spacing: 10) {
                    Text("지은이")
                        .font(.medium16)
                    Text(bookInfo.title)
                        .font(.light16)
                }
                HStack(alignment: .top, spacing: 10) {
                    Text("출판사")
                        .font(.medium16)
                    Text(bookInfo.publisher)
                        .font(.light16)
                }
                HStack(alignment: .top, spacing: 10) {
                    Text("줄거리")
                        .font(.medium16)
                    Text(bookInfo.plot)
                        .font(.light16)
                }
            }
            .fixedSize(horizontal: false, vertical: true)
            .padding()
            .background(Color.white)
            .clipShape(.rect(cornerRadius: 10))
            .padding(.horizontal, 25)
            .offset(x: 0, y: offset)
            .onAppear {
                withAnimation(.spring()) {
                    offset = 0
                }
            }
        }
        .ignoresSafeArea()
    }
}

//#Preview {
//    BookInfodialog(isActive: .constant(true))
//}

//
//  BookInfoDialog.swift
//  Moment
//
//  Created by phang on 12/11/23.
//

import SwiftUI

// MARK: - Book Info
struct BookInfoData {
    let title: String
    let author: String
    let publisher: String
    let plot: String
    
    static let bookInfoDummyData: BookInfoData = BookInfoData(title: "세이노의 가르침", author: "세이노",
                                                              publisher: "데이원", plot: "2000년부터 발표된 그의 주옥같은 글들. 독자들이 자발적으로 만든 제본서는 물론, 전자책과 앱까지 나왔던 《세이노의 가르침》이 드디어 전국 서점에서 독자들을 마주한다. 여러 판본을 모으고 저자의 확인을 거쳐 최근 생각을 추가로 수록하였다. 정식 출간본에만 추가로 수록된 글들은 목차와 본문에 별도 표시하였다.")
}

// MARK: - Dialog
struct BookInfodialog: View {
    @State private var offset: CGFloat = 1000
    @Binding var isActive: Bool
    let bookInfo: BookInfoData = BookInfoData.bookInfoDummyData

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

#Preview {
    BookInfodialog(isActive: .constant(true))
}

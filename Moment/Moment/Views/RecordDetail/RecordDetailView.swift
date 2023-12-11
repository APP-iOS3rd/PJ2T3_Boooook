//
//  RecordDetailView.swift
//  Moment
//
//  Created by phang on 12/11/23.
//

import SwiftUI

struct RecordDetailView: View {
//    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
//    @State private var showingAlert = false
    private let recordData = RecordData.recordDummyData
    
    var body: some View {
        GeometryReader { geo in
            ScrollView {
                VStack(alignment: .leading) {
                    ImageHorizontalScrollView(geo: geo, photos: recordData.photos)
                    Group {
                        Text("\(recordData.page)페이지")
                            .font(.light14)
                        Text(recordData.paragraph)
                            .font(.medium20)
                            .multilineTextAlignment(.center)
                            .padding(.bottom, 20)
                        Text(recordData.commentary)
                            .font(.regular16)
                            .padding(.bottom, 20)
                        Text("오후 4시 11분")
                            .font(.light14)
                        HStack(spacing: 0) {
                            Text(recordData.location)
                                .font(.semibold16)
                            Text(" 에서의 기록이에요")
                                .font(.regular16)
                        }
                    }
                    .padding(.horizontal, 20)
                }

            }
            .scrollIndicators(.hidden)
//            .navigationBarBackButtonHidden(true)
//            .toolbar {
//                ToolbarItem(placement: .topBarLeading) {
//                    Button {
//                        self.presentationMode.wrappedValue.dismiss()
//                    } label: {
//                         Image(systemName: "chevron.left")
//                            .aspectRatio(contentMode: .fit)
//                    }
//                }
//                ToolbarItem(placement: .principal) {
//                     Text("2023년 12월 06일")
//                        .fontWeight(.semibold)
//                        .foregroundStyle(Color.darkBrown)
//                }
//                ToolbarItem(placement: .topBarTrailing) {
//                    Button {
//                        showingAlert.toggle()
//                    } label: {
//                         Image(systemName: "trash")
//                            .aspectRatio(contentMode: .fit)
//                    }
//                }
//            }
//            .alert("기록을 삭제할까요?", isPresented: $showingAlert) {
//                Button("삭제", role: .destructive) {
//                    showingAlert = false
//                    // TODO: 데이터 삭제, 화면 이동
//                }
//                Button("돌아가기", role: .cancel) {
//                    showingAlert = false
//                }
//            }
        }
    }
}

#Preview {
    RecordDetailView()
}

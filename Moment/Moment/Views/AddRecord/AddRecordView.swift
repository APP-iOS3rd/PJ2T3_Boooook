//
//  AddRecordMain.swift
//  Moment
//
//  Created by 정인선 on 12/11/23.
//

import SwiftUI

struct AddRecordView: View {
    
    // 책 정보
    private let bookInfo = BookData.bookDummyData
    // 사용자 위치 정보
    @State var place: String = "부산광역시 수영구 민락수변로 12-1 (민락동)"
    // TextField 입력 정보
    @State var placeAlias: String = ""
    @State var paragraph: String = ""
    @State var page: Int? = nil
    @State var plot: String = ""
    
    var body: some View {
        ScrollView() {

            VStack {
                
// MARK: - 책 정보
                Text(bookInfo.title)
                    .font(.bold20)
                
                Image(bookInfo.image)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 150, height: 220)
                
                Text(bookInfo.author)
                    .font(.regular16)
                
// MARK: - 텍스트 필드 입력
                VStack(alignment: .leading) {

                    // MARK: 위치 정보
                    Text("현재 위치")
                        .font(.regular16)

                    ZStack {
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(Color.lightBrown)
                            .foregroundStyle(.clear)
                        
                        HStack {
                            Text(place)
                                .font(.regular14)
                            Spacer()
                            Button {
                                
                            } label: {
                                Image(systemName: "location")
                                    .foregroundStyle(.lightBrown)
                            }
                        }
                        .padding(10)
                    }
                    
                    TextField("위치를 기억할 이름을 지어주세요.", text: $placeAlias)
                        .textFieldStyle(BorderedTextFieldStyle())
                        .padding(.bottom, 20)
                    
                    // MARK: 기록
                    Text("나의 기록")
                        .font(.regular16)
                    
                    TextField("책에서 기록하고자 하는 문장을 적어주세요.", text: $paragraph)
                        .textFieldStyle(BorderedTextFieldStyle())
                    
                    TextField("해당 문장이 있는 페이지를 적어주세요.", value: $page, format: .number)
                        .textFieldStyle(BorderedTextFieldStyle())
                        .keyboardType(.asciiCapableNumberPad)
                    
                    TextEditor(text: $plot)
                        .font(.regular14)
                        .padding(5)
                        .frame(height: 200)
                        .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(Color.lightBrown)
                        )
                    
                    ImageSelectHorizontalScrollView()
                        .padding(.vertical)
                    
                    // MARK: 저장 버튼
                    Button {
                        
                    } label: {
                        Text("기록 저장하기")
                            .font(.regular16)
                    }
                    .buttonStyle(.customProminent(color: .offBrown))
                    

                }
                .padding(20)
            }
            
            
        }
        .onTapGesture {
            hideKeyboard()
        }
    }
}


// MARK: - 키보드 내리기
extension View {
  func hideKeyboard() {
    UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
  }
}

#Preview {
    AddRecordView()
}

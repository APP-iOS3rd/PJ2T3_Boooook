import SwiftUI

struct AddRecordView: View {
    @State private var showPickerMap: Bool = false
    // 사용자 위치 정보
    @State private var place: String = "부산광역시 수영구 민락수변로 12-1 (민락동)"
    // TextField 입력 정보
    @State private var placeAlias: String = ""
    @State private var paragraph: String = ""
    @State private var page: Int? = nil
    @State private var plot: String = ""
    // Photos
    @State private var photoData: [UIImage?] = [
        nil, nil, nil
    ]
//    @Binding var path: NavigationPath
//    @State private var navigationPath = NavigationPath()
    @State var showMainView: Bool = false
    // 책 정보
    let bookInfo: SelectedBook
    @EnvironmentObject var router: Router
    private var dataIsEmpty: Bool {
        if [placeAlias, paragraph, plot].contains("") || page == nil || photoData[0] == nil {
            return true
        } else {
            return false
        }
    }
    
    // Alert
    @State private var showingAlert: Bool = false
    var body: some View {
        ScrollView() {
            VStack {
                // MARK: - 책 정보
                Text(bookInfo.title)
                    .font(.bold20)
                
                fetchImage(url: bookInfo.theCoverOfBook)
                
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
                                showPickerMap.toggle()
                            } label: {
                                Image(systemName: "map")
                                    .foregroundStyle(.lightBrown)
                            }
                            .sheet(isPresented: $showPickerMap) {
                                LocationPickerMapView(showPickerMap: $showPickerMap,
                                                      locationAddress: $place)
                            }
                        }
                        .padding(10)
                    }
                    
                    TextField("위치를 기억할 이름을 지어주세요.", text: $placeAlias)
                        .textFieldStyle(BorderedTextFieldStyle())
                        .padding(.bottom, 20)
                        .textInputAutocapitalization(.never)
                    
                    // MARK: 기록
                    Text("나의 기록")
                        .font(.regular16)
                    
                    TextField("책에서 기록하고자 하는 문장을 적어주세요.", text: $paragraph)
                        .textFieldStyle(BorderedTextFieldStyle())
                        .textInputAutocapitalization(.never)
                    
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
                        .textInputAutocapitalization(.never)
                        .keyboardType(.default)
                
                    ImageSelectHorizontalScrollView(photoDummyData: $photoData)
                        .padding(.vertical)
                    
                    
                    // MARK: 저장 버튼
                    Button {
                        if !dataIsEmpty {
                            showingAlert.toggle()
                        }
                    } label: {
                        Text(dataIsEmpty ? "아직 다 작성되지 않았어요" : "기록 저장하기")
                            .font(.regular16)
                            
                    }
                    .buttonStyle(.customProminent(color: dataIsEmpty ? .gray3 : .lightBrown))
                    .alert("기록할까요?", isPresented: $showingAlert) {
                        Button("아니요") {}
                        Button {
                            divideRecordTime()
                            showMainView = true
                            router.clear()
                        } label: {
                            Text("네")
                        }
                    } message: {
                        Text("기록은 수정할 수 없어요...🥲")
                    }
                }
                .padding(20)
            }
        }
        .navigationDestination(isPresented: $showMainView, destination: {
            MainView()
        })
        .onTapGesture {
            hideKeyboard()
        }
    }
    
    func divideRecordTime() {
//        let dividedTime = DivideTimeStruct.init(date: Date())
//        UserData.mangjaeData.recordList[0].year = dividedTime.changeYearToString()
//        UserData.mangjaeData.recordList[0].monthAndDay = dividedTime.changeDayToString()
//        UserData.mangjaeData.recordList[0].time = dividedTime.changeTimeToString()
//        //망재 데이터에 임의로 추가하게끔
//        //UserData.mangjaeData.recordList[0].commentary = "dhkdkdkdkdkdkr"
//
//        print(UserData.mangjaeData.recordList[0])
    }
    func fetchImage(url: String) -> some View {
        AsyncImage(url: URL(string: url)) { image in
            image.resizable()
        } placeholder: {
            ProgressView()
        }
        .frame(width: 70, height: 87)
    }
    
}

//MARK: RecordDataStruct - 더미데이터 삭제할 때 그쪽의 구조 지우기
//struct DivideTimeStruct {
//    var date: Date
//
//    func changeDayToString() -> String {
//        let formatter = DateFormatter()
//        formatter.dateFormat = "MM월 dd일"
//        let changeDateFormatting = formatter.string(from: date)
//
//        return changeDateFormatting
//    }
//
//    func changeYearToString() -> Int {
//        let formatter = DateFormatter()
//        formatter.dateFormat = "YYYY"
//        let changeDateFormatting = formatter.string(from: date)
//
//        return Int(changeDateFormatting) ?? 2023
//    }
//
//    func changeTimeToString() -> String {
//        let formatter = DateFormatter()
//        formatter.dateFormat = "HHmm"
//        let changeDivideFormatting = formatter.string(from: date)
//
//        return changeDivideFormatting
//    }
//}

// MARK: - 키보드 내리기
extension View {
  func hideKeyboard() {
    UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
  }
}

//#Preview {
//    AddRecordView()
//}

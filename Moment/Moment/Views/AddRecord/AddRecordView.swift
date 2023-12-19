import SwiftUI
import SwiftData
import MapKit

struct AddRecordView: View {
	@Environment(\.dismiss) private var dismiss
	
    @State private var showPickerMap: Bool = false
    // 사용자 위치 정보
    @State private var latitude: Double = 0
    @State private var longitude: Double = 0
    @State private var localName: String = "" // 민재가 쓸 데이터
    @State private var place: String = "" // real 주소
    // TextField 입력 정보
    @State private var myLocation: String = ""
    @State private var paragraph: String = ""
    @State private var page: Int?
    @State private var commentary: String = ""
    // Photos
    @State private var photoData: [UIImage?] = [
        nil, nil, nil
    ]

	//
	@State private var year: Int = 0
	@State private var monthAndDay: String = ""
	@State private var time: String = ""

    @State var showMainView: Bool = false
    @Binding var isRecord: Bool
    
    // 책 정보
    let bookInfo: SelectedBook
    @EnvironmentObject var router: Router
    private var dataIsEmpty: Bool {
        if [myLocation, paragraph, commentary].contains("") || page == nil || photoData[0] == nil {
            return true
        } else {
            return false
        }
    }
	
	@Environment(\.modelContext) private var modelContext
	@Query private var bookList: [MomentBook]
    
    // Alert
    @State private var showingAlert: Bool = false
    var body: some View {
        ScrollView() {
            VStack {
                // MARK: - 책 정보
                Text(bookInfo.title)
                    .font(.bold20)
                    .padding(.horizontal, 20)
                
                fetchImage(url: bookInfo.theCoverOfBook)
                
                Text(bookInfo.author)
                    .font(.regular16)
                    .padding(.horizontal, 20)
                
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
                                                      latitude: $latitude,
                                                      longitude: $longitude,
                                                      localName: $localName,
                                                      place: $place)
                            }
                        }
                        .padding(10)
                    }
                    
                    TextField("위치를 기억할 이름을 지어주세요.", text: $myLocation)
                        .textFieldStyle(BorderedTextFieldStyle())
                        .padding(.bottom, 20)
                        .textInputAutocapitalization(.never)
                    
                    // MARK: 기억
                    Text("기억할 내용")
                        .font(.regular16)
                    
                    TextField("책에서 기억하고자 하는 문장을 적어주세요.", text: $paragraph)
                        .textFieldStyle(BorderedTextFieldStyle())
                        .textInputAutocapitalization(.never)
                    
                    TextField("해당 문장이 있는 페이지를 적어주세요.", value: $page, format: .number)
                        .textFieldStyle(BorderedTextFieldStyle())
                        .keyboardType(.asciiCapableNumberPad)
                    
                    TextEditor(text: $commentary)
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
                        Text(dataIsEmpty ? "아직 다 작성되지 않았어요" : "기억 저장하기")
                            .font(.medium16)
                    }
                    .buttonStyle(.customProminent(color: dataIsEmpty ? .gray3 : .lightBrown))
                    .alert("기억을 남길까요?", isPresented: $showingAlert) {
                        Button("돌아가기") {}
                        Button("저장하기") {
                            isRecord = true
							Task {
								await swiftDataInsert()
							}
                            showMainView = true
                            router.clear()
                        }
                    } message: {
                        Text("저장된 기억은 수정할 수 없어요...🥲")
                    }
                }
                .padding(20)
            }
        }
        .scrollDismissesKeyboard(.immediately)
        .task {
            await getLocationManager()
		}
        .navigationDestination(isPresented: $showMainView) {
            MainView()
        }
        .onTapGesture {
            hideKeyboard()
        }
		.navigationBarBackButtonHidden()
		.toolbar {
			ToolbarItem(placement: .topBarLeading) {
				Button {
					dismiss()
				} label: {
					Image(systemName: "chevron.left")
						.aspectRatio(contentMode: .fit)
				}
			}
		}
    }

    func getLocationManager() async {
        let manager = CLLocationManager()
        manager.requestWhenInUseAuthorization()
        await withCheckedContinuation { continuation in
            Task {
                // 위치 정보 동의가 이루어질 때까지 대기
                while manager.authorizationStatus == .notDetermined {
                    try await Task.sleep(nanoseconds: 100_000_000)  // 0.1초
                }
                if manager.authorizationStatus == .authorizedWhenInUse || manager.authorizationStatus == .authorizedAlways {
                    manager.desiredAccuracy = kCLLocationAccuracyBest
                    await fetchLocation(manager: manager)
                }
                continuation.resume()
            }
        }
    }
    
    func fetchLocation(manager: CLLocationManager) async {
        guard let location = manager.location else { return }
        self.latitude = location.coordinate.latitude
        self.longitude = location.coordinate.longitude
        let cllocation = CLLocation(latitude: self.latitude, longitude: self.longitude)
        let geocoder = CLGeocoder()
        let locale = Locale(identifier: "ko-KR")
        do {
            let placemarks = try await geocoder.reverseGeocodeLocation(cllocation, preferredLocale: locale)
            if let address = placemarks.last {
                self.place = "\(address.country ?? "") \(address.locality ?? "") \(address.name ?? "")"
                self.localName = address.administrativeArea ?? ""
            }
        } catch let error {
            print("Geocoding error: \(error.localizedDescription)")
        }
    }
    
    func fetchImage(url: String) -> some View {
        AsyncImage(url: URL(string: url)) { image in
            image.resizable()
        } placeholder: {
            ProgressView()
        }
        .frame(width: 70, height: 87)
    }
	
	private func imageToData() async -> [Data] {
		var imageDatas: [Data] = []
		for photo in photoData {
			if let photo = photo?.resize(newWidth: 300) {
				print(photo)
				if let jpegData = photo.jpegData(compressionQuality: 1.0) {
					print(jpegData)
					imageDatas.append(jpegData)
				} else if let pngData = photo.pngData() {
					imageDatas.append(pngData)
					print(pngData)
				}
			}
		}
		return imageDatas
	}
	
	private func swiftDataInsert() async {
		var imageData: [Data] = []
		imageData = await imageToData()
		
		formattedDateToCustom()
		
		var flag = false
		for book in bookList {
			if book.bookISBN == bookInfo.bookISBN {
				flag = true
				break
			}
		}
		if flag {
			modelContext.insert(MomentRecord(latitude: latitude, longitude: longitude, localName: localName, myLocation: myLocation, year: year, monthAndDay: monthAndDay, time: time, paragraph: paragraph, page: page ?? 0, commentary: commentary, photos: imageData, bookISBN: bookInfo.bookISBN))
		} else {
			modelContext.insert(MomentBook(bookISBN: bookInfo.bookISBN, theCoverOfBook: bookInfo.theCoverOfBook, title: bookInfo.title, author: bookInfo.author, publisher: bookInfo.publisher, plot: bookInfo.plot))
			
			modelContext.insert(MomentRecord(latitude: latitude, longitude: longitude, localName: localName, myLocation: myLocation, year: year, monthAndDay: monthAndDay, time: time, paragraph: paragraph, page: page ?? 0, commentary: commentary, photos: imageData, bookISBN: bookInfo.bookISBN))
		}
	}
	
	func formattedDateToCustom() {
		let dividedTime = FormattedTime.init(date: Date())
		year = dividedTime.formattedYearToInt()
		monthAndDay = dividedTime.formattedDayToString()
		time = dividedTime.formattedTimeToString()
	}
}

//#Preview {
//    AddRecordView()
//}

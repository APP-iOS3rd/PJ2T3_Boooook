//
//  AddRecordMain.swift
//  Moment
//
//  Created by 정인선 on 12/11/23.
//

import SwiftUI
import MapKit

struct AddRecordView: View {
	@Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @State private var showPickerMap: Bool = false
    // 사용자 위치 정보
    @State private var latitude: Double = 0
    @State private var longitude: Double = 0
    @State private var localName: String = ""
    @State private var place: String = ""
    // TextField 입력 정보
    @State private var placeAlias: String = ""
    @State private var paragraph: String = ""
    @State private var page: Int? = nil
    @State private var plot: String = ""
    // Photos
    @State private var photoData: [UIImage?] = [
        nil, nil, nil
    ]
    // 책 정보
    let bookInfo: SelectedBook
    
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
					.lineLimit(2)
					.padding(.horizontal, 20)
                
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
                                                      latitude: $latitude,
                                                      longitude: $longitude,
                                                      localName: $localName,
                                                      place: $place)
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
                        Button("네") {
                        }
                    } message: {
                        Text("기록은 수정할 수 없어요...🥲")
                    }
                }
                .padding(20)
            }
        }
        .onAppear {
            Task {
                await fetchLocation()
            }
        }
        .onTapGesture {
            hideKeyboard()
        }
		.navigationBarBackButtonHidden(true)
		.toolbar {
			ToolbarItem(placement: .topBarLeading) {
				Button {
					self.presentationMode.wrappedValue.dismiss()
				} label: {
					 Image(systemName: "chevron.left")
						.aspectRatio(contentMode: .fit)
				}
			}
		}
    }
    
    func getLocationManager() async -> CLLocationManager {
        let manager = CLLocationManager()
        manager.desiredAccuracy = kCLLocationAccuracyBest
        manager.requestWhenInUseAuthorization()
        return manager
    }
    
    func fetchLocation() async {
        let manager = await getLocationManager()
        guard let location = manager.location else { return }
        self.latitude = location.coordinate.latitude
        self.longitude = location.coordinate.longitude
        let cllocation = CLLocation(latitude: self.latitude, longitude: self.longitude)
        let geocoder = CLGeocoder()
        let locale = Locale(identifier: "ko-KR")
        do {
            let placemarks = try await geocoder.reverseGeocodeLocation(cllocation, preferredLocale: locale)
            if let address = placemarks.last {
                DispatchQueue.main.async {
                    self.place += address.country ?? ""
                    self.place += address.locality ?? ""
                    self.place += address.name ?? ""
                    self.localName = address.administrativeArea ?? ""
                }
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
}


// MARK: - 키보드 내리기
extension View {
  func hideKeyboard() {
    UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
  }
}

//#Preview {
//    AddRecordView()
//}

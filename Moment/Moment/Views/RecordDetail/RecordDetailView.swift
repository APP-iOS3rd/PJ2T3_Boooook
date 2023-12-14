//
//  RecordDetailView.swift
//  Moment
//
//  Created by phang on 12/11/23.
//

import SwiftUI
import MapKit
import SwiftData

struct RecordDetailView: View {
    @Environment(\.dismiss) private var dismiss

    @State private var showingAlert = false
    @State private var goMainView = false
	
	@Environment(\.modelContext) private var modelContext
	@Query var recordList: [MomentRecord]
	@Query var bookList: [MomentBook]
	
	let recordID: UUID
	var recordInfo: MomentRecord? {
		recordList.first { $0.id == recordID }
	}
	
	var book: MomentBook? {
		bookList.first { $0.bookISBN == recordInfo?.bookISBN }
	}
	
	var isLastBook: Bool {
		recordList.filter { $0.bookISBN == bookList.first { $0.bookISBN == recordInfo?.bookISBN }?.bookISBN }.count == 1
	}
	
    var body: some View {
        GeometryReader { geo in
            ScrollView {
				if let recordInfo = recordInfo {
					VStack(alignment: .leading) {
						ImageHorizontalScrollView(geo: geo, photos: recordInfo.photos)
						Group {
							Text("\(recordInfo.page)페이지")
								.font(.light14)
							Text(recordInfo.paragraph)
								.font(.medium20)
								.multilineTextAlignment(.center)
								.padding(.bottom, 20)
							Text(recordInfo.commentary)
								.font(.regular16)
								.padding(.bottom, 20)
							Text(formattedTimeToString(timeString: recordInfo.time))
								.font(.light14)
							HStack(spacing: 0) {
								Text(recordInfo.myLocation)
									.font(.semibold16)
								Text(" 에서의 기록이에요")
									.font(.regular16)
							}
						}
						.padding(.horizontal, 20)
						MiniMapView(coordinate: CLLocationCoordinate2D(latitude: recordInfo.latitude, longitude: recordInfo.longitude), locationName: recordInfo.myLocation, geo: geo)
					}
				}
            }
            .scrollIndicators(.hidden)
            .navigationBarBackButtonHidden(true)
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Button {
                        dismiss()
                    } label: {
                         Image(systemName: "chevron.left")
                            .aspectRatio(contentMode: .fit)
                    }
                }
                ToolbarItem(placement: .principal) {
					if let recordInfo = recordInfo {
						Text("\(String(recordInfo.year))년 \(recordInfo.monthAndDay)")
							.fontWeight(.semibold)
							.foregroundStyle(Color.darkBrown)
					}
                }
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        showingAlert.toggle()
                    } label: {
                         Image(systemName: "trash")
                            .aspectRatio(contentMode: .fit)
                    }
                }
            }
            .alert("기록을 삭제할까요?", isPresented: $showingAlert) {
                Button("삭제", role: .destructive) {
                    showingAlert = false
					if let recordInfo = recordInfo {
						if isLastBook, let book = book {
							modelContext.delete(recordInfo.self)
							modelContext.delete(book.self)
						} else {
							modelContext.delete(recordInfo.self)
                            dismiss()
						}
                        goMainView = true
                    }
                }
                Button("돌아가기", role: .cancel) {
                    showingAlert = false
                }
            }
            .navigationDestination(isPresented: $goMainView) {
                MainView()
            }
        }
    }
	
	func formattedTimeToString(timeString: String) -> String {
		let hour = Int(timeString.prefix(2)) ?? 0
		let minute = Int(timeString.suffix(2)) ?? 0
		var result = ""
		switch hour {
		case 0:
			result += "오전 12시"
		case 1...11:
			result += "오전 \(hour)시"
		case 12:
			result += "오후 \(hour)시"
		default:
			result += "오후 \(hour - 12)시"
		}
		
		return result + " \(minute)분"
	}
}

//#Preview {
//    RecordDetailView()
//}

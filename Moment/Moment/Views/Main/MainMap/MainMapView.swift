//
//  MainMapView.swift
//  Moment
//
//  Created by Minjae Kim on 12/11/23.
//

import SwiftUI
import MapKit
import CoreLocation

// AddRecordView에서 현재 위치를 저장 시
// LocalName enum 형태의 값으로 저장 후
// 그 값을 가져와ㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏ라.
struct MainMapView: View {
	@StateObject var mainMapVM = MainMapVM()
	@Binding var recordList: [MyRecord]
	
	var body: some View {
		Map(bounds: .init(MapCameraBounds(maximumDistance: 1600000)), interactionModes: .all) {
			// 딕셔너리가 비어있지 않을 때
			if !mainMapVM.dict.isEmpty {
				// 딕셔너리의 키값으로 배열을 매핑 후 순회
				ForEach(mainMapVM.dict.map { $0.key }, id: \.self) { local in
					if let data = mainMapVM.dict[local]?.first, let count = mainMapVM.dict[local]?.count {
						Annotation("", coordinate: local.coodinate, anchor: .bottom) {

							NavigationLink {
								Text(data.localName)
							} label: {
								ZStack {
									RoundRectBalloon()
										.fill(.white)
										.frame(width: 65, height: 65)
									
									Image(systemName: "square.and.arrow.up.circle")
										.resizable()
										.frame(width: 60, height: 60)
										.clipShape(.rect(cornerRadius: 8))
								}
								.overlay {
									NotificationCount(value: count)
								}
							}
						}
					}
				}
			}
		}
		.onAppear {
			Task {
				await mainMapVM.fetchLocalData(recordList: recordList)
			}
		}
		.onChange(of: recordList) {
			Task {
				await mainMapVM.fetchLocalData(recordList: recordList)
			}
		}
	}
}

#Preview {
	MainMapView(recordList: .constant(UserData.mangjaeData.recordList))
}

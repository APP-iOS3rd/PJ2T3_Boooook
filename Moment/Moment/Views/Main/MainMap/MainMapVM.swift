//
//  MainMapVM.swift
//  Moment
//
//  Created by Minjae Kim on 12/12/23.
//

import SwiftUI
import CoreLocation

class MainMapVM: ObservableObject {
	@Published var dict: [LocalName: [RecordLocalData]] = [:]
	
	@MainActor
	func fetchLocalData() async {
		dict = [:]
		for data in RecordLocalData.dummyDatas {
			dict[data.localName, default: []].append(data)
		}
	}
}

//
//  MainMapVM.swift
//  Moment
//
//  Created by Minjae Kim on 12/12/23.
//

import SwiftUI
import CoreLocation

class MainMapVM: ObservableObject {
	@Published var dict: [LocalName: [MyRecord]] = [:]
		var localNames = LocalName.allCases

		@MainActor
		func fetchLocalData(recordList: [MyRecord]) async {
			dict = Dictionary(grouping: recordList) { record in
				if let localName = localNames.first(where: { $0.rawValue == record.localName }) {
					return localName
				} else {
					return LocalName.defaultCase
				}
			}
			.compactMapValues { records in
				records.reduce(into: []) { result, record in
					result.append(record)
				}
			}
		}
}

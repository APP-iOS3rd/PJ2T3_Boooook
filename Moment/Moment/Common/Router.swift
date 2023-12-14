//
//  Route.swift
//  Moment
//
//  Created by 백대홍 on 12/14/23.
//

import SwiftUI

enum Route: String, Hashable {
    case MainView
    case RecordDetailView
    case AddRecordView
    case ShelfRecordLisview
    case SelectedBook
}

class Router: ObservableObject {
    @Published var path = NavigationPath()
        
    func clear() {
        path = .init()
    }
}

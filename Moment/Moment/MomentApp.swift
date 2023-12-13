//
//  MomentApp.swift
//  Moment
//
//  Created by phang on 12/11/23.
//

import SwiftUI

@main
struct MomentApp: App {
    @State private var isLoading = true
    
    var body: some Scene {
        WindowGroup {
//            SelectedBooktoAPIView()
            if isLoading {
                SplashView(isActive: $isLoading)
            } else {
                ContentView()
            }
        }
    }
}

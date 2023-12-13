//
//  ContentView.swift
//  Moment
//
//  Created by phang on 12/11/23.
//


import SwiftUI

struct ContentView: View {
    @AppStorage("isOnboarding") var isOnboarding: Bool = true

    var body: some View {
        if isOnboarding {
            OnboardingMainView()
        } else {
            MainShelfView()
        }
    }
}

#Preview {
    ContentView()
}

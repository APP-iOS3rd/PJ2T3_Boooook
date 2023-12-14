//
//  OnboardingMainView.swift
//  Moment
//
//  Created by phang on 12/11/23.
//

import SwiftUI

struct OnboardingMainView: View {
    var onboardings: [OnboardingData] = OnboardingData.onboardingsData
    
    var body: some View {
        VStack {
            TabView {
                ForEach(onboardings[0...2]) { item in
                    OnboardingCardView(onboarding: item)
                }
            }
            .tabViewStyle(PageTabViewStyle())
            .padding(.vertical, 20)
            .onAppear {
                setupAppearance()
            }
            StartButtonView()
        }

    }
    
    func setupAppearance() {
        UIPageControl.appearance().currentPageIndicatorTintColor = .mainBrown
        UIPageControl.appearance().pageIndicatorTintColor = UIColor.black.withAlphaComponent(0.2)
      }
}

#Preview {
    OnboardingMainView()
}

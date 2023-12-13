//
//  OnboardingCardView.swift
//  Moment
//
//  Created by 백대홍 on 12/11/23.
//

import SwiftUI

struct OnboardingCardView: View {
    @State private var isAnimating: Bool = false
    var onboarding: OnboardingData
    
    var body: some View {
        VStack(alignment: .center) {
            Text(onboarding.title)
                .font(.title)
                .foregroundStyle(Color.mainBrown)
            
            Image(onboarding.image)
                .resizable()
                .frame(width: 296, height: 449)
                .padding()
            
            
        }
    }
}

#Preview {
    OnboardingCardView(onboarding: OnboardingData(title: "모멘트와 함께\n기억 속에 남겨두고 싶은\n책의 내용을 기록해보세요.", image: "Group 331"))
}

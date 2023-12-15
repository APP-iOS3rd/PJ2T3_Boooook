//
//  OnboardingData.swift
//  Moment
//
//  Created by 백대홍 on 12/11/23.
//

import Foundation
import SwiftUI

// MARK: - Onboarding DATA MODEL
struct OnboardingData: Identifiable {
    var id = UUID()
    var title: String
    var image: String
    
    static let onboardingsData: [OnboardingData] = [
        OnboardingData(title: "모멘트와 함께\n기억 속에 남겨두고 싶은\n책의 내용을 기록해보세요.", image: "onboarding01"),
        OnboardingData(title: "모멘트와 함께\n어디서 읽었는지\n기억하고 싶지 않으신가요?", image: "onboarding02"),
        OnboardingData(title: "모멘트와 함께\n기록하여 여러분만의\n책장을 완성시켜 보아요!", image: "onboarding03")
    ]
}

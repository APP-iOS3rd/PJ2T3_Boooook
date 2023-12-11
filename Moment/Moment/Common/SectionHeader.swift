//
//  SectionHeader.swift
//  Moment
//
//  Created by 백대홍 on 12/11/23.
//



import SwiftUI

struct SectionHeader: View {
    var texts: [String] = ["2023", "닥터 스트레인지-대혼돈의 멀티버스스트레인지-대혼돈의 멀티버스스트레인지-대혼돈의 멀티버스", "공부는 왜 해야하나", "간장공장 공장장은 간공장장이고", "파워포스 레인져"]
    
    var body: some View {
        VStack(spacing: 20) {
            ForEach(texts, id: \.self) { text in
                HStack(spacing: 10) {
                    Text(text)
                        .foregroundColor(Color.lightBrown)
                        .multilineTextAlignment(.leading)
                        .padding(.horizontal, 10)
                        .background(Color.offBrown)
                        .cornerRadius(10)
                        .fixedSize(horizontal: false, vertical: false)
                    Spacer()
                }
                .frame(minWidth: 0, maxWidth: .infinity)
            }
        }
        .padding()
    }
}

#Preview {
    SectionHeader()
    
}

//
//  SegmentBar.swift
//  Moment
//
//  Created by 백대홍 on 12/11/23.
//

import SwiftUI

struct SegmentBar: View {
    @Binding var preselectedIndex: Int
    var options: [String] = ["책장으로 보기", "지도로 보기"]
    let selectedColor = Color.mainBrown
    let deselectedColor = Color.offBrown
    
    var body: some View {
        HStack(spacing: 0) {
            ForEach(options.indices, id:\.self) { index in
                ZStack(alignment: .center) {
                    Rectangle()
                        .fill(deselectedColor)
                    Rectangle()
                        .fill(preselectedIndex == index ? selectedColor : deselectedColor)
                        .cornerRadius(20)
                        .padding(2)
                        .overlay(
                            RoundedRectangle(cornerRadius: 20)
                                .stroke(Color.clear, lineWidth: 2)
                                .padding(.horizontal, -2)
                        )
                        .onTapGesture {
                            withAnimation(.interactiveSpring()) {
                                preselectedIndex = index
                            }
                        }
                    
                    Text(options[index])
                        .foregroundColor(preselectedIndex == index ? .white : selectedColor)
                        .padding(.horizontal, 10)
                    
                }
            }
        }
        .frame(width: 370, height: 40)
        .cornerRadius(20)
    }
}

#Preview {
    SegmentBar(preselectedIndex: .constant(0), options: ["책장으로 보기", "지도로 보기"])
}

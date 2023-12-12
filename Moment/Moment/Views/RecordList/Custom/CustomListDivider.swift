//
//  CustomListDivider.swift
//  Moment
//
//  Created by 홍세희 on 2023/12/12.
//


import SwiftUI

struct CustomListDivider: View {
    var body: some View {
        Rectangle()
            .fill(Color.offBrown)
            .frame(height: 1)
            .padding(20)
    }
}

#Preview {
    CustomListDivider()
}

//
//  CustomShelf.swift
//  Moment
//
//  Created by 백대홍 on 12/12/23.
//

import SwiftUI

struct CustomShelf: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        let height: CGFloat = 20
        path.move(to: CGPoint(x: rect.minX, y: rect.maxY - height))
        path.addLine(to: CGPoint(x: rect.minX, y: rect.maxY))
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY - height))
        path.addLine(to: CGPoint(x: rect.maxX - 5, y: rect.maxY - (height - 5)))
        path.addLine(to: CGPoint(x: rect.minX + 5, y: rect.maxY - (height - 5)))
        path.addLine(to: CGPoint(x: rect.minX, y: rect.maxY - height))
        return path
    }
}

#Preview {
    VStack {
        ForEach(0...2, id: \.self) { _ in
            HStack {
                ZStack {
                    Image("hoon", bundle: nil)
                        .resizable()
                        .frame(width: 130, height: 170)
                    
                    CustomShelf()
                        .fill(.lightBrown)
                        .frame(width: 150, height: 180)
                }
                Spacer()
                ZStack {
                    Image("bonobono", bundle: nil)
                        .resizable()
                        .frame(width: 130, height: 170)
                    
                    CustomShelf()
                        .fill(.lightBrown)
                        .frame(width: 150, height: 180)
                }
            }
        }
        .padding(.vertical)
    }
}

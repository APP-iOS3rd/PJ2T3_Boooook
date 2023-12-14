//
//  CustomShelf.swift
//  Moment
//
//  Created by 백대홍 on 12/12/23.
//

import SwiftUI

struct CustomShelfUP: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        let height: CGFloat = 12
        
        path.move(to: CGPoint(x: rect.minX, y: rect.maxY - height))
        path.addLine(to: CGPoint(x: rect.minX - 7, y: rect.maxY))
        path.addLine(to: CGPoint(x: rect.maxX + 7, y: rect.maxY))
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY - height))
        
        path.move(to: CGPoint(x: rect.minX, y: rect.maxY - height))
        return path
    }
}

struct CustomShelfDOWN: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        let height: CGFloat = 5
        
        path.move(to: CGPoint(x: rect.minX , y: rect.maxY))
        path.addLine(to: CGPoint(x: rect.minX - 7, y: rect.maxY - height))
        path.addLine(to: CGPoint(x: rect.maxX + 7, y: rect.maxY - height))
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))
        
        path.move(to: CGPoint(x: rect.minX, y: rect.maxY - height))
        return path
    }
}


//#Preview {
//    VStack {
//        ForEach(0...2, id: \.self) { _ in
//            HStack {
//                ZStack(alignment: .bottom) {
//                    Image("hoon", bundle: nil)
//                        .resizable()
//                        .frame(width: 130, height: 170)
//                        .shadow(radius: 5, x: 5, y: -5)
//                        .zIndex(1)
//                        .padding(.bottom, 10)
//                    
//                    CustomShelfUP()
//                        .fill(.lightBrown)
//                        .frame(width: 160)
//                        .border(Color.black)
//                        .padding(.bottom, 5)
//                    
//                    CustomShelfDOWN()
//                        .fill(.mainBrown)
//                        .frame(width: 160)
//                        .border(Color.black)
//                }
//                Spacer()
//                ZStack(alignment: .bottom) {
//                    Image("bono", bundle: nil)
//                        .resizable()
//                        .frame(width: 130, height: 170)
//                        .shadow(radius: 5, x: 5, y: -5)
//                        .zIndex(1)
//                        .padding(.bottom, 10)
//                    
//                    CustomShelfUP()
//                        .fill(.lightBrown)
//                        .frame(width: 160)
//                        .padding(.bottom, 5)
//                    
//                    CustomShelfDOWN()
//                        .fill(.mainBrown)
//                        .frame(width: 160)
//                }
//            }
//        }
//        .padding(.vertical)
//    }
//}

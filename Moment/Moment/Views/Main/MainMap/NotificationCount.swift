//
//  NotificationCount.swift
//  Moment
//
//  Created by Minjae Kim on 12/11/23.
//

import SwiftUI

struct NotificationCount: View {
	
	let value: Int
	@State var foreground: Color = .white
	@State var background: Color = .blue
	
	private let x: CGFloat = 65
	private let y: CGFloat = 0
	
    var body: some View {
		ZStack {
			Capsule()
				.fill(.darkBrown)
				.frame(width: 25 * widthMultiplier(), height: 25)
				.position(x: x, y: y)
			if value < 100 {
				Text("\(value)")
					.foregroundStyle(foreground)
					.position(x: x, y: y)
					.font(.light20)
			} else {
				Text("99+")
					.foregroundStyle(foreground)
					.position(x: x, y: y)
					.font(.light20)
			}
		}
    }
	
	private func widthMultiplier() -> Double {
		if value < 10 {
			return 1.0
		}
		
		if value < 100 {
			return 1.5
		}
		
		return 2.0
	}
}

#Preview {
	NotificationCount(value: 200)
}

//
//  RoundRectBallon.swift
//  Moment
//
//  Created by Minjae Kim on 12/11/23.
//

import SwiftUI

struct RoundRectBalloon: Shape {
	func path(in rect: CGRect) -> Path {
		var path = Path()
		let radius = 10.0
		
		path.move(to: CGPoint(x: rect.minX + 10, 
							  y: rect.minY))
		path.addLine(to: CGPoint(x: rect.maxX - 10, 
								 y: rect.minY))
		
		path.addRelativeArc(center: CGPoint(x: rect.maxX - 10, 
											y: rect.minY + radius),
							radius: radius,
							startAngle: Angle.degrees(-90), 
							delta: Angle.degrees(90))
		
		path.move(to: CGPoint(x: rect.maxX, 
							  y: rect.minY + radius))
		
		path.addLine(to: CGPoint(x: rect.maxX, 
								 y: rect.maxY - radius))
		path.addRelativeArc(center: CGPoint(x: rect.maxX - radius, 
											y: rect.maxY - radius),
							radius: radius,
							startAngle: Angle.degrees(0), 
							delta: Angle.degrees(90))
		
		path.addLine(to: CGPoint(x: rect.midX + radius, 
								 y: rect.maxY))
		
		path.addLine(to: CGPoint(x: rect.midX, y: 
									rect.maxY + 15))
		path.addLine(to: CGPoint(x: rect.midX - radius, 
								 y: rect.maxY))
		path.addRelativeArc(center: CGPoint(x: rect.minX + radius, 
											y: rect.maxY - radius), 
							radius: radius,
							startAngle: Angle.degrees(90), 
							delta: Angle.degrees(90))
		
		path.addLine(to: CGPoint(x: rect.minX, 
								 y: rect.minY + 10))
		path.addRelativeArc(center: CGPoint(x: rect.minX + radius, 
											y: rect.minY + 10),
							radius: radius,
							startAngle: Angle.degrees(-180), 
							delta: Angle.degrees(90))
		
		return path
	}
}

struct MarkerButton: View {
	var body: some View {
		VStack {
			ZStack {
				RoundRectBalloon()
					.fill(.white)
					.frame(width: 90, height: 90)
				
				Image("bono", bundle: nil)
					.resizable()
					.frame(width: 80, height: 80)
					.clipShape(.rect(cornerRadius: 8))
			}
			.overlay {
				NotificationCount(value: 100)	
			}
		}
	}
}

#Preview {
	MarkerButton()
}

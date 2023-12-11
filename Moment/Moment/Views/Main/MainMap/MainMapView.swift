//
//  MainMapView.swift
//  Moment
//
//  Created by Minjae Kim on 12/11/23.
//

import SwiftUI
import MapKit

// Marker가 겹치는 순간 두 Marker가 합쳐져야함
struct MainMapView: View {
    var body: some View {
		// 37.5431887
		// 127.1228852
		
		// 37.5393384
		// 127.1263004
		
		// 37.54443, 127.1242
		Map(interactionModes: .all) {
			Annotation("", coordinate: CLLocationCoordinate2D(latitude: 37.5431887, longitude: 127.1228852), anchor: .bottom) {
				Button(action: {}, label: {
					ZStack {
						RoundRectBalloon()
							.fill(.white)
							.frame(width: 65, height: 65)
						
						Image("hoon", bundle: nil)
							.resizable()
							.frame(width: 60, height: 60)
							.clipShape(.rect(cornerRadius: 8))
					}
					.overlay {
						NotificationCount(value: .constant(40))
					}
				})
			}
			MapCircle(center: CLLocationCoordinate2D(latitude: 37.5431887, longitude: 127.1228852), radius: CLLocationDistance(50))
				.foregroundStyle(.orange)
			
			Annotation("", coordinate: CLLocationCoordinate2D(latitude: 37.5393384, longitude: 127.1263004), anchor: .bottom) {
				Button(action: {}, label: {
					ZStack {
						RoundRectBalloon()
							.fill(.white)
							.frame(width: 65, height: 65)
						
						Image("bonobono", bundle: nil)
							.resizable()
							.frame(width: 60, height: 60)
							.clipShape(.rect(cornerRadius: 8))
					}
					.overlay {
						NotificationCount(value: .constant(55))
					}
				})
			}
			
			MapCircle(center: CLLocationCoordinate2D(latitude: 37.5393384, longitude: 127.1263004), radius: CLLocationDistance(50))
				.foregroundStyle(.orange)
			
		}
		.mapControls {
			MapUserLocationButton()
			MapPitchToggle()
		}
    }
}

#Preview {
    MainMapView()
}

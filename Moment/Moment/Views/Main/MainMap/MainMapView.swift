//
//  MainMapView.swift
//  Moment
//
//  Created by Minjae Kim on 12/11/23.
//

import SwiftUI
import MapKit

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
							.frame(width: 90, height: 90)
						
						Image("hoon", bundle: nil)
							.resizable()
							.frame(width: 80, height: 80)
							.clipShape(.rect(cornerRadius: 8))
					}
					
				})
			}
			
			Annotation("", coordinate: CLLocationCoordinate2D(latitude: 37.5393384, longitude: 127.1263004), anchor: .bottom) {
				Button(action: {}, label: {
					ZStack {
						RoundRectBalloon()
							.fill(.white)
							.frame(width: 90, height: 90)
						
						Image("bonobono", bundle: nil)
							.resizable()
							.frame(width: 80, height: 80)
							.clipShape(.rect(cornerRadius: 8))
					}
					
				}).badge(20)
			}
			
		}
    }
}

#Preview {
    MainMapView()
}

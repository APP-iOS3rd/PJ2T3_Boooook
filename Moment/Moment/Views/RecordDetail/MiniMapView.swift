//
//  MiniMapView.swift
//  Moment
//
//  Created by phang on 12/11/23.
//

import SwiftUI
import MapKit

struct MiniMapView: View {
	let coordinate: CLLocationCoordinate2D
	let locationName: String
	@State var region: MapCameraPosition
    let geo: GeometryProxy
	init(coordinate: CLLocationCoordinate2D, locationName: String, geo: GeometryProxy) {
		self.coordinate = coordinate
		self.locationName = locationName
		self._region = State(initialValue: MapCameraPosition.region(
			MKCoordinateRegion(center: coordinate, span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01)))
		)
		self.geo = geo
	}
    var body: some View {
        Map(position: $region) {
			Annotation(locationName, coordinate: self.coordinate) {
                ZStack {
                    Circle()
                        .fill(Color.pink)
                }
            }
        }
        .overlay(alignment: .bottomTrailing) {
            Button {
                region = MapCameraPosition.region(
					MKCoordinateRegion(center: self.coordinate,
                                       span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01))
                )
            } label: {
                ZStack {
                    Circle()
                        .fill(.gray4.opacity(0.8))
                        .frame(width: 40)
                    Image(systemName: "location")
                        .fontWeight(.semibold)
                        .foregroundStyle(.darkBrown)
                }
            }
            .padding([.bottom, .trailing])
        }
        .frame(height: max(geo.size.height * 0.2, 0))
        .clipShape(.rect(cornerRadius: 10))
        .padding(20)
    }
}

//#Preview {
//    GeometryReader { geo in
//        MiniMapView(geo: geo)
//    }
//}

//
//  LocationMapView.swift
//  Moment
//
//  Created by phang on 12/11/23.
//

import SwiftUI
import MapKit

// MARK: - Location
extension CLLocationCoordinate2D {
    static let locationDummyData = CLLocationCoordinate2D(
        latitude: 37.5100, longitude: 126.9956
    )
}

struct LocationMapView: View {
    @State private var region = MapCameraPosition.region(
        MKCoordinateRegion(center: .locationDummyData,
                           span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01))
    )
    let geo: GeometryProxy
    
    var body: some View {
        Map(position: $region) {
            Annotation("My Record", coordinate: .locationDummyData) {
                ZStack {
                    Circle()
                        .fill(Color.pink)
                }
            }
        }
        .frame(height: max(geo.size.height * 0.2, 0))
        .clipShape(.rect(cornerRadius: 10))
        .padding(20)
    }
}

#Preview {
    GeometryReader { geo in
        LocationMapView(geo: geo)
    }
}

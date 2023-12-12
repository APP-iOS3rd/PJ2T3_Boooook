//
//  LocationPickerMapView.swift
//  Moment
//
//  Created by phang on 12/12/23.
//

import SwiftUI

struct LocationPickerMapView: View {
    @Binding var showPickerMap: Bool
    @Binding var locationAddress: String
    @StateObject private var locationManager = LocationManager()

    var body: some View {
        VStack {
            ZStack {
                PickerMap(locationManager: locationManager)
                    .ignoresSafeArea(.all)
                MapBalloon()
                    .frame(width: 30, height: 55)
                    .foregroundStyle(locationManager.isChanging ? .pink.opacity(0.7) : .pink)
                    .offset(y: locationManager.isChanging ? -20 : -15)
                Circle()
                    .fill(locationManager.isChanging ? .white.opacity(0.7) : .white)
                    .frame(width: 12)
                    .offset(y: locationManager.isChanging ? -20 : -15)
            }
            .overlay(alignment: .bottomTrailing) {
                Button {
                    locationManager.mapViewFocusChange()
                } label: {
                    ZStack {
                        Circle()
                            .fill(.white.opacity(0.9))
                            .frame(width: 40)
                        Image(systemName: "location")
                            .foregroundStyle(.darkBrown)
                            .fontWeight(.bold)
                    }
                }
                .padding([.bottom, .trailing])
            }
            VStack(alignment: .leading, spacing: 30) {
                Text(locationManager.currentPlace)
                    .font(.bold20)
                Button {
                    if !locationManager.isChanging {
                        self.locationAddress = locationManager.currentPlace
                    }
                    self.showPickerMap = false
                } label: {
                    Text("이 위치로 설정하기")
                        .font(.bold18)
                        .foregroundStyle(.white)
                }
                .buttonStyle(.customProminent(color: locationManager.isChanging ? .gray3 : .lightBrown))
            }
            .padding()
        }
    }
}

struct MapBalloon: Shape {
    var startAngle: Angle = .degrees(180)
    var endAngle: Angle = .degrees(0)

    func path(in rect: CGRect) -> Path {
        var path = Path()
        path.move(to: CGPoint(x: rect.midX, y: rect.maxY))
        path.addCurve(to: CGPoint(x: rect.minX, y: rect.midY),
                      control1: CGPoint(x: rect.midX, y: rect.maxY),
                      control2: CGPoint(x: rect.minX, y: rect.midY + rect.height / 5))
        path.addArc(center: CGPoint(x: rect.midX, y: rect.midY), radius: rect.width / 2,
                    startAngle: startAngle, endAngle: endAngle, clockwise: false)
        path.addCurve(to: CGPoint(x: rect.midX, y: rect.maxY),
                      control1: CGPoint(x: rect.maxX, y: rect.midY + rect.height / 5),
                      control2: CGPoint(x: rect.midX, y: rect.maxY))
        return path
    }
}

#Preview {
    LocationPickerMapView(showPickerMap: .constant(true), locationAddress: .constant(""))
}

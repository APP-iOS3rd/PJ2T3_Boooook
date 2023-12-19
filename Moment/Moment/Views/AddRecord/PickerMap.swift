//
//  PickerMap.swift
//  Moment
//
//  Created by phang on 12/12/23.
//

import SwiftUI
import MapKit

struct PickerMap: UIViewRepresentable {
    @ObservedObject var locationManager: LocationManager
    
    func makeUIView(context: Context) -> some UIView {
        return locationManager.mapView
    }
    
    func updateUIView(_ uiView: UIViewType, context: Context) {
        //
    }
}

class LocationManager: NSObject, ObservableObject, MKMapViewDelegate, CLLocationManagerDelegate {
    @Published var mapView: MKMapView = .init()
    @Published var isChanging: Bool = false
    @Published var latitude: Double = 0
    @Published var longitude: Double = 0
    @Published var localName: String = ""
    @Published var place: String = ""
    private var manager: CLLocationManager = .init()
    private var currentGeoPoint: CLLocationCoordinate2D?
    
    override init() {
        super.init()
        self.configureLocationManager()
    }
    
    // 위치 권한 여부 확인, 요청
    func configureLocationManager() {
        mapView.isRotateEnabled = false
        
        mapView.delegate = self
        manager.delegate = self

        manager.desiredAccuracy = kCLLocationAccuracyBest
        
        let status = manager.authorizationStatus
        if status == .notDetermined {
            manager.requestAlwaysAuthorization()
        } else if status == .authorizedAlways || status == .authorizedWhenInUse {
            mapView.showsUserLocation = true
        }
    }
    
    // 화면 이동 시, 호출
    func mapViewDidChangeVisibleRegion(_ mapView: MKMapView) {
        DispatchQueue.main.async {
            self.isChanging = true
        }
    }
    
    // 화면 이동 종료 시, 호출
    func mapView(_ mapView: MKMapView, regionDidChangeAnimated animated: Bool) {
        let location: CLLocation = CLLocation(latitude: mapView.centerCoordinate.latitude, longitude: mapView.centerCoordinate.longitude)
        self.convertLocationToAddress(location: location)
        DispatchQueue.main.async {
            self.isChanging = false
        }
    }
    
    // 지도 포커스 옮기는 메서드
    func mapViewFocusChange() {
        print("OK - Map Focus Changed")
        let span = MKCoordinateSpan(latitudeDelta: 0.007, longitudeDelta: 0.007)
        // 현재 위치 받아서 위도 경도 넣어주기
        let region = MKCoordinateRegion(center: self.currentGeoPoint ?? CLLocationCoordinate2D(latitude: 37.5100, longitude: 126.9956),
                                        span: span)
        mapView.setRegion(region, animated: true)
    }
    
    // 위치 권한 변경 시 호출
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        if manager.authorizationStatus == .authorizedWhenInUse || manager.authorizationStatus == .authorizedAlways {
            guard let location = manager.location else {
                print("Error - No Location")
                return
            }
            self.currentGeoPoint = location.coordinate
            self.mapViewFocusChange()
            self.latitude = location.coordinate.latitude
            self.longitude = location.coordinate.longitude
            self.convertLocationToAddress(location: location)
        }
    }
    
    // 사용자 위치 변경 시
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        print("OK - Did Update Locations")
    }
    
    // 현재 위치 가져오기 실패
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("Error - \(error.localizedDescription)")
    }
    
    // 주소 변환
    func convertLocationToAddress(location: CLLocation) {
        let geocoder = CLGeocoder()
        geocoder.reverseGeocodeLocation(location) { placemarks, error in
            if error != nil {
                return
            }
            guard let placemark = placemarks?.first else { return }
            self.place = "\(placemark.country ?? "") \(placemark.locality ?? "") \(placemark.name ?? "")"
            self.localName = placemark.administrativeArea ?? ""
        }
    }
}


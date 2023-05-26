//
//  LocationManager.swift
//  WeatherTaskSwiftUI
//
//  Created by Petro on 26.05.2023.
//

import Foundation
import CoreLocation

class LocationManager: NSObject, ObservableObject, CLLocationManagerDelegate {
    let manager = CLLocationManager()
    var onLocationResult: ((Result<CLLocationCoordinate2D, Error>) -> Void)?
    
    override init() {
        super.init()
        manager.delegate = self
    }
    
    func requestAuthorization() {
        manager.requestAlwaysAuthorization()
    }
    
    func requestLocation() {
        manager.requestLocation()
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.first?.coordinate {
            manager.requestAlwaysAuthorization()
            onLocationResult?(.success(location))
            manager.stopUpdatingLocation()
            onLocationResult = nil
        } else {
            onLocationResult?(.failure(NSError(domain: "No location detected", code: 0)))
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        onLocationResult?(.failure(error))
    }
    
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        manager.requestLocation()
    }
}



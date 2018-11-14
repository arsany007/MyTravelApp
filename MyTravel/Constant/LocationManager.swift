//
//  LocationManager.swift
//  MyTravel
//
//  Created by Apple on 09/10/18.
//  Copyright © 2018 Emple. All rights reserved.
//

import UIKit
import CoreLocation

class LocationManager: NSObject {
    
    
    var locationGranted: Bool?
    
    /// Core location
    private let locationManager: CLLocationManager =  CLLocationManager()
    
    /// Location manager current state
    //  var state = LocationManageState.stoped
    
    /// Location
    var currentLocation = CLLocation()

    static let shared: LocationManager = {
        let instance = LocationManager()
        return instance
    }()
    
    
    
    //Initializer access level change now
    private override init(){}
    
    func requestForLocation(){
        //Code Process
        locationGranted = true
        print("Location granted")
        
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
        //locationManager.distanceFilter = kCLDistanceFilterNone
        //locationManager.desiredAccuracy = kCLLocationAccuracyBest
        
        locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
        locationManager.activityType = .automotiveNavigation
        locationManager.distanceFilter = 10.0  // Movement threshold for new events
        //locationManager.allowsBackgroundLocationUpdates = true
        
        self.getPermission()
        
//        if (permission == false) {
//            displayAlertWithTitleMessageAndTwoButtons()
//        }
        locationManager.startUpdatingLocation()
    }
    
    func getPermission() -> Bool {
        
        switch CLLocationManager.authorizationStatus() {
        case .authorizedAlways:
            return true
        case .authorizedWhenInUse:
            return true
        case .denied, .restricted, .notDetermined:
            return false
        }
    }

    /// Display Permission alert
    func displayAlertWithTitleMessageAndTwoButtons() {
        
        let alertController = UIAlertController(title: "Enable Location",
                                                message: "The location permission was not authorized. Please enable it in Settings to continue.",
                                                preferredStyle: .alert)
        
        let settingsAction = UIAlertAction(title: "Settings", style: .default) { (alertAction) in
            
            /// Settings url
            //  let locationUrl = URL(string: "App-Prefs:root=Privacy&path=Bluetooth")
            UIApplication.shared.open(NSURL(string:UIApplicationOpenSettingsURLString + Bundle.main.bundleIdentifier!)! as URL, options: [:], completionHandler: nil)
        }
        alertController.addAction(settingsAction)
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        alertController.addAction(cancelAction)
        APPDELEGATE.window?.rootViewController?.present(alertController, animated: true, completion: nil)
    }
}


/// Location manager delegate methods
extension LocationManager: CLLocationManagerDelegate {
   
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        print("Did Location access permission was changed: \(status)")
        
        switch status {
        case .denied:
            print("get Location permission to access")
            self.displayAlertWithTitleMessageAndTwoButtons()
        case .notDetermined,.restricted:
            print("get Location permission to access")
            manager.requestWhenInUseAuthorization()
        default:
            print("Permission given")
           
        }
    }
    
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let userLocation:CLLocation = locations[0] as CLLocation
        
        // Call stopUpdatingLocation() to stop listening for location updates,
        // other wise this function will be called every time when user location changes.
        
        // manager.stopUpdatingLocation()
        
        print("user latitude = \(userLocation.coordinate.latitude)")
        print("user longitude = \(userLocation.coordinate.longitude)")
    }
    
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error)
    {
        print("Error \(error)")
    }
    
    
    func locationManagerDidPauseLocationUpdates(_ manager: CLLocationManager) {
    }
    
    func locationManagerDidResumeLocationUpdates(_ manager: CLLocationManager) {
    }
}

//
//  DiscoverVC.swift
//  MyTravel
//
//  Created by Apple on 09/10/18.
//  Copyright © 2018 Emple. All rights reserved.
//

import UIKit
import GoogleMaps
import GooglePlaces
import MapKit
import SDWebImage
import WebKit



class DiscoverVC: BaseVC , GMSMapViewDelegate, CLLocationManagerDelegate{

    @IBOutlet weak var mapView: GMSMapView!

    
    var locationManager = CLLocationManager()
    var currentLocation: CLLocation?
    var placesClient: GMSPlacesClient!
    var zoomLevel: Float = 15.0
    
    var placeObj = [PlaceObject]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        locationManager = CLLocationManager()
        self.ShowNavigationBar(backImage: #imageLiteral(resourceName: "menu_icon"), color: UIColor.white)
        self.title = "Discover"
        
        self.initializeTheLocationManager()
        
        mapView.settings.myLocationButton = true
        mapView.settings.zoomGestures = true
        mapView.isMyLocationEnabled = true
        mapView.delegate = self
    }

    func initializeTheLocationManager() {
        if CLLocationManager.locationServicesEnabled(){
            locationManager.delegate = self
            locationManager.desiredAccuracy = kCLLocationAccuracyBest
            locationManager.distanceFilter = 500
            locationManager.requestWhenInUseAuthorization()
            locationManager.requestAlwaysAuthorization()
            locationManager.startUpdatingLocation()
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
   
    // Handle authorization for the location manager.
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        switch status {
        case .restricted:
            print("Location access was restricted.")
        case .denied:
            print("User denied access to location.")
            // Display the map using the default location.
            mapView.isHidden = false
        case .notDetermined:
            print("Location status not determined.")
        case .authorizedAlways: fallthrough
        case .authorizedWhenInUse:
            print("Location status is OK.")
            cameraMoveToLocation(toLocation: manager.location?.coordinate)
        }
    }
    func mapView(_ mapView: GMSMapView, didTap overlay: GMSOverlay) {
        
        print("TAP")
    }
    // Handle location manager errors.
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        locationManager.stopUpdatingLocation()
        print("Error: \(error)")
    }
    
    func locationManager(manager: CLLocationManager!, didUpdateLocations locations: [AnyObject]!) {
        
        let location = locationManager.location?.coordinate
        cameraMoveToLocation(toLocation: location)
    }
    
    func cameraMoveToLocation(toLocation: CLLocationCoordinate2D?) {
        
        if toLocation != nil {
            mapView.camera = GMSCameraPosition.camera(withTarget: toLocation!, zoom: 15)
            getPlaceFromAPI(location: toLocation!)
        }
    }
    
    func getPlaceFromAPI(location:CLLocationCoordinate2D){
        
        let apiName = "https://api.sygictraveldata.com/1.0/en/places/list?location=\(location.longitude),\(location.latitude)"
        
        APPDELEGATE.showIndicator(view: self.view)
        APIManager.shared.sendGetRequest(apiName, headeras: [:], andSuccessBlock: { (response) in
            print(response)
            APPDELEGATE.hideIndicator(view: self.view)
            
            if let dataDict = response as? NSDictionary{
                
                self.placeObj.removeAll()
                self.mapView.clear()
                if let obj = dataDict.value(forKey: "data") as? NSDictionary{
                    
                    if let placeObj = obj.value(forKey: "places") as? NSArray{
                        
                        for dict in placeObj{
                            
                            self.placeObj.append(PlaceObject.init(dictionary: dict as! NSDictionary)!)
                            
                            let objDict = dict as! NSDictionary
                            
                            if let locationDict = objDict.value(forKeyPath: "location") as? NSDictionary{
                                
                                DispatchQueue.main.async(execute: {
                                    let marker = GMSMarker()
                                   
                                    let markerView = UIImageView()
                                    markerView.sd_setImage(with: URL(string: objDict.value(forKey: "thumbnail_url") as! String), placeholderImage: #imageLiteral(resourceName: "placeholder"))
                                    markerView.frame = CGRect(x: 0, y: 0, width: 50, height: 50)
                                    markerView.layer.cornerRadius = (markerView.frame.size.height/2)
                                    markerView.layer.borderWidth = 1.0
                                    markerView.layer.borderColor = UIColor.gray.cgColor
                                    markerView.layer.masksToBounds = true
                                    markerView.contentMode = .scaleAspectFit
                                    
                                    // Customize color of marker here:
                                    markerView.tintColor = UIColor.brown
                                    marker.iconView = markerView
                                    marker.isTappable = true
                                    marker.position = CLLocationCoordinate2D(latitude: locationDict.value(forKey: "lat") as! CLLocationDegrees, longitude: locationDict.value(forKey: "lng") as! CLLocationDegrees)
                                  marker.title = "Test"
                                    marker.map = self.mapView
                                    // *IMPORTANT* Assign all the spots data to the marker's userData property
                                    marker.userData = objDict
                                    
                                   
                                })
                            }
                        }
                        print("COUNT:",self.placeObj.count)
                        
                        
                        

                    }
                }
            }
        }) { (error) in
            print(error.localizedDescription)
        }
    }
    
    
    func mapView(_ mapView: GMSMapView, didTap marker: GMSMarker) -> Bool {
        print("MARKER TAP")
        
        let dict = marker.userData as! NSDictionary
        let storyboard = UIStoryboard.init(name: "Main", bundle: nil)
        let detailVC = storyboard.instantiateViewController(withIdentifier: "PlaceDetailVC") as? PlaceDetailVC
        detailVC?.placeURL = dict.value(forKey: "url") as! String
        self.navigationController?.pushViewController(detailVC!, animated: true)
        return true
    }
    func mapView(_ mapView: GMSMapView, didTapAt coordinate: CLLocationCoordinate2D) {
        
        print("TAPPP")
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    

}

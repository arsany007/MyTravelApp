//
//  TripObject.swift
//  MyTravel
//
//  Created by Apple on 24/10/18.
//  Copyright © 2018 Emple. All rights reserved.
//

import UIKit

class TripObject: NSObject {

    public var endDate : String?
    public var id : String?
    public var name : String?
    public var starttDate : String?
    public var status : String?
    public var userId : String?

    public var loationObj = [TripLocationObject]()
    
    
    required public init?(dictionary: NSDictionary) {
        endDate = dictionary["endDate"] as? String
        id = dictionary["id"] as? String
        name = dictionary["name"] as? String
        
        starttDate = dictionary["starttDate"] as? String
        status = dictionary["status"] as? String
        userId = dictionary["userId"] as? String
        
//        loationObj = dictionary["pois"] as? TripLocationObject
        
        if let arrData = dictionary["pois"] as? NSArray{
            
            for dictData in arrData{
                loationObj.append(TripLocationObject.init(dictionary: dictData as! NSDictionary)!)
            }
            
        }
    }
}

class TripLocationObject : NSObject{
    
    public var desc : String?
    public var image : String?
    public var name : String?
    public var rate : String?
    public var walkDistance : String?
    public var placeLoationObj = [PlaceLocationObject]()
    public var mapLoationObj = [MapLocationObject]()
    
    required public init?(dictionary: NSDictionary) {
        desc = dictionary["description"] as? String
        image = dictionary["image"] as? String
        name = dictionary["name"] as? String
        rate = dictionary["rate"] as? String
        walkDistance = dictionary["walkDistance"] as? String

        if let dictData = dictionary["location"] as? NSDictionary{
            placeLoationObj.append(PlaceLocationObject.init(dictionary: dictData)!)
        }
        
        if let dictData = dictionary["location_maps"] as? NSDictionary{
                mapLoationObj.append(MapLocationObject.init(dictionary: dictData)!)
        }
    }
}

class PlaceLocationObject : NSObject{
    
    public var latitude : Double?
    public var longitude : Double?
    
    required public init?(dictionary: NSDictionary) {
        latitude = dictionary["latitude"] as? Double
        longitude = dictionary["longitude"] as? Double
    }
}

class MapLocationObject : NSObject{
    
    public var latitude : Double?
    public var longitude : Double?
    
    required public init?(dictionary: NSDictionary) {
        latitude = dictionary["latitude"] as? Double
        longitude = dictionary["longitude"] as? Double
    }
}

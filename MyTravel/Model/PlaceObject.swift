//
//  PlaceObject.swift
//  MyTravel
//
//  Created by Apple on 11/10/18.
//  Copyright © 2018 Emple. All rights reserved.
//

import UIKit

class PlaceObject: NSObject {

    public var id : String?
    public var level : String?
    public var name : String?
    public var name_suffix : String?
    public var original_name : String?
    public var url : String?
    public var thumbnail_url : String?
    
    public var parentIdObj : ParentId?
    public var loationObj : LocationObject?
    
    
    required public init?(dictionary: NSDictionary) {
        id = dictionary["id"] as? String
        level = dictionary["level"] as? String
        name = dictionary["name"] as? String
        name_suffix = dictionary["name_suffix"] as? String
        original_name = dictionary["original_name"] as? String
        url = dictionary["url"] as? String
        thumbnail_url = dictionary["thumbnail_url"] as? String
        
        parentIdObj = dictionary["parent_ids"] as? ParentId
        loationObj = dictionary["location"] as? LocationObject
    }
}

class ParentId : NSObject{
    public var city_id : String?
    public var region : String?
    public var continent : String?
    
    required public init?(dictionary: NSDictionary) {
        city_id = dictionary["city_id"] as? String
        region = dictionary["region"] as? String
        continent = dictionary["continent"] as? String
    }
}

class LocationObject : NSObject{
    public var latitude : String?
    public var longitude : String?
    
    required public init?(dictionary: NSDictionary) {
        latitude = dictionary["lat"] as? String
        longitude = dictionary["lng"] as? String
    }
}

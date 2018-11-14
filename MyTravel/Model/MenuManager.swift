//
//  MenuManager.swift
//  ActionTrac
//
//  Created by Apple on 22/09/18.
//  Copyright © 2018 Emple. All rights reserved.
//

import UIKit

enum MenuItem:Int,CustomStringConvertible {
    case Login
    case DiscoverArea
    case PlanTrip
    case TourGuide
    case FriendsHangout
    case Share
    case Settings
    
    var description: String {
        return "\(rawValue)"
    }
}
class MenuManager: NSObject {

    
    static func getMenuArray() -> NSMutableArray{
        
        let menuArr = NSMutableArray()
        
        for type  in MenuItem.Login.rawValue...MenuItem.Settings.rawValue {
            
            let val = getMenuObject(type: type)
            
            let dict = NSMutableDictionary()
            dict.setValue(val.0, forKey: "title")
            dict.setValue(val.1, forKey: "image")
            
            menuArr.add(dict)
        }
        return menuArr
    }
    
    static func getMenuObject(type:Int) -> (String,String){
        
        let type : MenuItem = MenuItem(rawValue: type)!

        var title = ""
        var imageName = ""
        
        switch type {
        case .Login:
            title = "Log In / Profile"
            imageName = "login & profile"//"thumbs-up"
            break;
        case .DiscoverArea:
            title = "Discover Area"
            imageName = "discover_area_white" //"stars"
            break;
        case .PlanTrip:
            title = "Plan Trip"
            imageName = "plan_trip_white" //"passage-of-time"
            break;
        case .TourGuide:
            title = "Tour Guide"
            imageName = "tour guide" //"mail"
            break;
        case .FriendsHangout:
            title = "Friends Hangout"
            imageName = "friend hangout" //"logout"
            break;
        case .Share:
            title = "Share"
            imageName = "Share" //"logout"
            break;
        case .Settings:
            title = "Settings"
            imageName = "Setting" //"logout"
            break;
        }
        return (title,imageName)
    }
}

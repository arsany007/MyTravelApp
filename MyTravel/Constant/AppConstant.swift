//
//  AppConstant.swift
//  ActionTrac
//
//  Created by Akshay on 10/25/16.
//  Copyright © 2016. All rights reserved.
//

import Foundation
import UIKit
import SystemConfiguration
//import Alamofire


/*
 Client ID: AYZtkIdWoG8No8rWwonqf-_NepfZRmT6ejfm2EwYHAGn6kw-cQTFJunxC-6J9aMyHzkYWj8JeTeQHNWb
 
 Secrete KEY: EBAh0dVB4IjCeZVt9eOdgKgcwpoUBKM2HxDXtoch2QaOLesKV8imYT8UPxFTDH-KYdRnSocUgdv_jfbN
 */
let APPDELEGATE: AppDelegate = UIApplication.shared.delegate as! AppDelegate

let USER_DETAILS = "user"
let EMPLOYEE_DETAILS = "employee_details"
let FINAL_EMPLOYEE_DETAILS = "employee_data"


struct DeviceType
{
    static let IS_IPHONE_4_OR_LESS  = UIDevice.current.userInterfaceIdiom == .phone && ScreenSize.SCREEN_MAX_LENGTH < 568.0
    static let IS_IPHONE_5          = UIDevice.current.userInterfaceIdiom == .phone && ScreenSize.SCREEN_MAX_LENGTH == 568.0
    static let IS_IPHONE_6          = UIDevice.current.userInterfaceIdiom == .phone && ScreenSize.SCREEN_MAX_LENGTH == 667.0
    static let IS_IPHONE_6_PLUS     = UIDevice.current.userInterfaceIdiom == .phone && ScreenSize.SCREEN_MAX_LENGTH == 736.0
    static let IS_IPAD              = UIDevice.current.userInterfaceIdiom == .pad && ScreenSize.SCREEN_MAX_LENGTH == 1024.0
}
struct ScreenSize
{
    static let SCREEN_WIDTH         = UIScreen.main.bounds.size.width
    static let SCREEN_HEIGHT        = UIScreen.main.bounds.size.height
    static let SCREEN_MAX_LENGTH    = max(ScreenSize.SCREEN_WIDTH, ScreenSize.SCREEN_HEIGHT)
    static let SCREEN_MIN_LENGTH    = min(ScreenSize.SCREEN_WIDTH, ScreenSize.SCREEN_HEIGHT)
}


let isIPad = UIDevice.current.userInterfaceIdiom == .pad

let FacebookInviteLink : String = "https://fb.me/113445352477240"
let IS_IPHONE = !isIPad
let IS_IPAD = isIPad


let themeColorDarkBlue = UIColor.init(red: 133.0/255, green: 185.0/255, blue: 190.0/255, alpha: 1.0)
let themeColorPurple = UIColor.init(red: 102.0/255, green: 83.0/255, blue: 147.0/255, alpha: 1.0)
let themeColorOrange = UIColor.init(red: 255.0/255, green: 102.0/255, blue: 0.0/255, alpha: 1.0)


class AppConstant: NSObject {

    static func getDrawerWidth() -> CGFloat{
        
        return ScreenSize.SCREEN_WIDTH * 0.75;
    }
    
    static func getDynamicHeight(width: CGFloat,str:String,font:UIFont) -> CGFloat {
        let constraintRect = CGSize(width: width, height: CGFloat.greatestFiniteMagnitude)
        let boundingBox = str.boundingRect(with: constraintRect, options: NSStringDrawingOptions.usesLineFragmentOrigin, attributes: [NSAttributedStringKey.font: font], context: nil)
        return ceil(boundingBox.height)
    }
    
    static func widthWithConstrainedHeight(height: CGFloat,str:String,font:UIFont) -> CGFloat{
        
        let constraintRect = CGSize(width: .greatestFiniteMagnitude, height: height)
        let boundingBox = str.boundingRect(with: constraintRect, options: .usesLineFragmentOrigin,attributes: [NSAttributedStringKey.font: font], context: nil)
        return ceil(boundingBox.width)
    }
    
    static func checkForIpad()  -> Bool {
    
        return UIDevice.current.userInterfaceIdiom == .pad
    
    }
}
    //MARK:- SET LOCALIZED
    func Locallized(title:String)->String {
    #if ProviderApp
        return  NSLocalizedString("provider_"+title, comment: "")
    #else
        return  NSLocalizedString(title, comment: "")
    #endif
    }
    func CommonLocallized(title:String)->String {
          return  NSLocalizedString(title, comment: "")
    }

    //MARK:- SET DATA USERDEFAULTS
    func userDefault(value:AnyObject, key:NSString){
        UserDefaults.standard.set(value, forKey: key as String )
        UserDefaults.standard.synchronize()
    }
    func userDefaultValueForKey(key:String?)->AnyObject?{
        return UserDefaults.standard.value(forKey: key!) as AnyObject?
    }

//MARK:- SET FONT SIZE
enum FontSizes : Int{
    case H0=0
    case H1=1
    case H2=2
    case H3=3
    case H4=4
    case H5=5
    case H6=6
    case H7=7
    case H8=8
    
    func fontSize()->CGFloat{
        let screenSize : CGFloat = ScreenSize.SCREEN_WIDTH;
        switch self{
        case .H0:
            return screenSize*0.09;
        case .H1:
            return screenSize*0.0625;
        case .H2:
            return screenSize*0.05625;
        case .H3:
            return (IS_IPAD ? screenSize*0.03 : screenSize*0.045);
        case .H4:
//            return screenSize*0.04375;
            return (IS_IPAD ? screenSize*0.03 : screenSize*0.04375);
        case .H5:
            return (IS_IPAD ? screenSize*0.02813 :screenSize*0.0415);
        case .H6:
//            return screenSize*0.03125;
            return (IS_IPAD ? screenSize*0.03125:screenSize*0.0375 );
        case .H7:
            return (IS_IPAD ? screenSize*0.02813 :  screenSize*0.0353);
        case .H8:
            return (IS_IPAD ? screenSize*0.02013 :  screenSize*0.0353);
        }
    }
}

func dictionryToJsonString(dic : NSDictionary) -> String{
    

do {
    let jsonData = try JSONSerialization.data(withJSONObject: dic, options: .prettyPrinted)
    // here "jsonData" is the dictionary encoded in JSON data
    
    let sting = String(bytes: jsonData, encoding: .utf8)!
//    // here "decoded" is of type `Any`, decoded from JSON data
////    NSLog(NSString(data: encryptedData, encoding: NSUTF8StringEncoding)!)
//
    return sting
   
    }
    catch {
        return ""
    }
}


func convertStringToDictionary(text: String) -> NSDictionary? {
    
    var inputString = text
    inputString = inputString.replacingOccurrences(of: "!~!", with: "\"")

    if let data = inputString.data(using: .utf8) {
        do {
            return try JSONSerialization.jsonObject(with: data, options: []) as? NSDictionary
        } catch {
            print(error.localizedDescription)
        }
    }
    return nil
}

func setViewShadow(view:UIView){
    view.layer.shadowColor = UIColor.gray.cgColor // View shadow
    view.layer.shadowOpacity = 0.5
    view.layer.shadowOffset = CGSize.zero
    view.layer.shadowRadius = 5
}
extension String{
    
    func trim() -> String{
        return self.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
    }
}





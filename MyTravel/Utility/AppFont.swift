//
//  AppFont.swift
//  Tolivi
//
//  Created by iMobDev on 07/11/16.
//  Copyright © 2016 imobdev@123. All rights reserved.
//

import Foundation
import UIKit

class AppFont: NSObject {
    
    static func font_OpenSans_Regular(size:CGFloat) -> UIFont
    {
        return UIFont(name: "OpenSans", size: size)!
    }
    static func font_OpenSans_Semibold(size:CGFloat) -> UIFont
    {
        return UIFont(name: "OpenSans-Semibold", size: size)!
    }
    static func font_OpenSans_Light(size:CGFloat) -> UIFont
    {
        return UIFont(name: "OpenSans-Light", size: size)!
    }
    static func font_OpenSans_Italic(size:CGFloat) -> UIFont
    {
        return UIFont(name: "OpenSans-Italic", size: size)!
    }
    static func font_OpenSans_Light_Italic(size:CGFloat) -> UIFont
    {
        return UIFont(name: "OpenSansLight-Italic", size: size)!
    }
    static func font_OpenSans_Bold(size:CGFloat) -> UIFont
    {
        return UIFont(name: "OpenSans-Bold", size: size)!
    }
    static func font_OpenSans_Extrabold(size:CGFloat) -> UIFont
    {
        return UIFont(name: "OpenSans-Extrabold", size: size)!
    }
    static func font_OpenSans_BoldItalic(size:CGFloat) -> UIFont
    {
        return UIFont(name: "OpenSans-BoldItalic", size: size)!
    }
    static func font_OpenSans_ExtraboldItalic(size:CGFloat) -> UIFont
    {
        return UIFont(name: "OpenSans-ExtraboldItalic", size: size)!
    }
    static func font_OpenSans_SemiboldItalic(size:CGFloat) -> UIFont
    {
        return UIFont(name: "OpenSans-SemiboldItalic", size: size)!
    }
    
    
    static func font_Karla_Regular(size:CGFloat) -> UIFont
    {
        return UIFont(name: "Karla-Regular", size: size)!
    }
    
    
}

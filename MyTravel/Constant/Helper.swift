//
//  Helper.swift
//  ActionTrac
//
//  Created by Apple on 14/07/18.
//  Copyright © 2018 Emple. All rights reserved.
//

import Foundation

import Foundation
import UIKit

enum BUTTON_TYPE {
    case Normal
    case WithSetting
}

class Helper: NSObject {
    
    static let  shared = Helper()
    
    class func clearUserDefults() {
        
        let defs = UserDefaults.standard
        let dict = defs.dictionaryRepresentation() as NSDictionary
        for key in dict.allKeys
        {
            if (key as! String != "TOKEN")
            {
                    defs.removeObject(forKey: key as! String)
            }
        }
        defs.synchronize()
    }
    
    
    class func underlineString(string:String) -> NSAttributedString {
        
        let underlineAttribute = [NSAttributedStringKey.underlineStyle: NSUnderlineStyle.styleSingle.rawValue]
        let underlineAttributedString = NSAttributedString(string: string, attributes: underlineAttribute)
        return underlineAttributedString
        
    }
    
    class func underlineButton(_ sender:UIButton) {
        
        let underlineAttribute = [NSAttributedStringKey.underlineStyle: NSUnderlineStyle.styleSingle.rawValue]
        let underlineAttributedString = NSAttributedString(string: sender.titleLabel?.text ?? "No title", attributes: underlineAttribute)
        sender.setAttributedTitle(underlineAttributedString, for: .normal)
        sender.setAttributedTitle(underlineAttributedString, for: .selected)
    }
    
    class func setPlaceholderWithColor(_ textField:UITextField, placeholder: String, color:UIColor){
        textField.attributedPlaceholder = NSAttributedString(string: placeholder,
                                                                    attributes: [NSAttributedStringKey.foregroundColor: color])
    }
    
//    class func underlineString(word:String,fullString:String) -> NSAttributedString {
//
//
//        if word == "" {
//
//            let underlineAttribute = [NSAttributedStringKey.underlineStyle: NSUnderlineStyle.styleSingle.rawValue]
//            let underlineAttributedString = NSAttributedString(string: fullString, attributes: underlineAttribute)
//            return underlineAttributedString
//
//        }else{
//
//            let wordRange = (fullString as NSString).range(of: word)
//
//
//            let attributedString = NSMutableAttributedString(string: fullString, attributes: [NSAttributedStringKey.font : UIFont.clearviewReguler (DPautomatic(16)),NSAttributedStringKey.foregroundColor : #colorLiteral(red: 0.06045617908, green: 0.1506827176, blue: 0.2217101455, alpha: 1)])
//
//            attributedString.setAttributes([NSAttributedStringKey.underlineStyle: NSUnderlineStyle.styleSingle.rawValue], range: wordRange)
//
//            return attributedString
//
//
//
//        }
//
//
//    }
    
    
    class func ShowNavigationBar(controller:UIViewController,backImage:UIImage?){
        
        controller.navigationController?.setNavigationBarHidden(false, animated: true)
        controller.navigationController?.navigationBar.tintColor = UIColor.white
        controller.navigationController?.navigationBar.barTintColor = themeColorPurple
        controller.navigationController?.navigationBar.titleTextAttributes = [NSAttributedStringKey.foregroundColor : UIColor.white,NSAttributedStringKey.font:UIFont.systemFont(ofSize:FontSizes.H3.fontSize())]
        controller.navigationController?.navigationBar.isTranslucent = false;
        controller.navigationController?.interactivePopGestureRecognizer?.isEnabled = true
        controller.navigationController?.interactivePopGestureRecognizer?.delegate = nil
        let backButton = UIBarButtonItem.init(image: backImage , style: .plain, target:controller.navigationController , action: #selector(controller.navigationController?.popViewController(animated:)))
        controller.navigationItem.leftBarButtonItem = backButton
        
        if(backImage == nil){
            controller.navigationItem.hidesBackButton = true
        }
        
     }
    
    
    class func returnJsonString(param:NSDictionary) -> NSString
    {
        let jsonData = try! JSONSerialization.data(withJSONObject: param, options: .prettyPrinted)
        return NSString(data: jsonData, encoding: String.Encoding.utf8.rawValue)!
    }
    
    
    
    class func addImage(fullString:String,addTextafter:String, image:UIImage, font:UIFont,isImageFirst:Bool = true) -> NSMutableAttributedString{
        
        let imageAttachment =  NSTextAttachment()
        imageAttachment.image = image
        //Set bound to reposition
        let imageOffsetY:CGFloat = -5.0;
        imageAttachment.bounds = CGRect(x: 0, y: imageOffsetY, width: imageAttachment.image!.size.width, height: imageAttachment.image!.size.height)
        //Create string with attachment
        
        let attachmentString = NSAttributedString(attachment: imageAttachment)
        //Initialize mutable string
        
        let completeText = NSMutableAttributedString.init(attributedString: attachmentString)
        
        
        
        let  fullString = NSMutableAttributedString(string: fullString, attributes: [NSAttributedStringKey.font : font,NSAttributedStringKey.foregroundColor : #colorLiteral(red: 0.06045617908, green: 0.1506827176, blue: 0.2217101455, alpha: 1)])
        //Add image to mutable string
        completeText.append(fullString)
        
        
        //Add your text to mutable string
        
        if isImageFirst == false {
            let  textAfterIcon = NSMutableAttributedString(string: addTextafter, attributes: [NSAttributedStringKey.font : font,NSAttributedStringKey.foregroundColor : #colorLiteral(red: 0.06045617908, green: 0.1506827176, blue: 0.2217101455, alpha: 1)])
            completeText.append(textAfterIcon)
        }
        return completeText
    }
    
    
    public class func image(From color: UIColor)-> UIImage {
        UIGraphicsBeginImageContext(CGSize(width: 1, height: 1))
        UIGraphicsGetCurrentContext()!.setFillColor(color.cgColor)
        UIGraphicsGetCurrentContext()!.fill(CGRect(x: 0, y: 0, width: 1, height: 1))
        let colorImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return colorImage!
    }
    
    
//    func createToolbar(withDone isDone:Bool) -> UIToolbar
//    {
//        let toolbar1: UIToolbar = UIToolbar(frame: CGRect(x: 0, y: 0, width: SCREEN_WIDTH, height: 44))
//        toolbar1.tintColor = UIColor.white
//
//        let doneBtn = UIBarButtonItem(barButtonSystemItem: isDone ? .done : .cancel, target: self, action:   #selector(self.donebuttonClicked(_:)))
//        doneBtn.tintColor = UIColor.lightGray
//
//        let space1 = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
//        toolbar1.setItems([space1,doneBtn], animated: true)
//        return toolbar1
//    }
    @objc func donebuttonClicked(_ sender:UIBarButtonItem)  {
        APPDELEGATE.window?.endEditing(true)
        
    }
    
    class func imageGenerateFor(view: UIView) -> UIImage {
        UIGraphicsBeginImageContext(view.frame.size)
        view.layer.render(in: UIGraphicsGetCurrentContext()!)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return image!
    }
    class func getStringFromDate(date:Date)->String{
        
        let dateFormat = DateFormatter()
        dateFormat.dateFormat = "HH:mm a"
        return dateFormat.string(from: date)
    }
    class func getTimeFormString(_ timeString:String) -> String{
        
        if timeString.count == 2 || timeString.count == 1{
            
            let dateFormat = DateFormatter()
            dateFormat.dateFormat = "HH"
            let date = dateFormat.date(from: timeString) ?? Date()
            dateFormat.dateFormat = "hh:mm a"
            return dateFormat.string(from: date)
            
        }else if (timeString.count == 3 || timeString.count == 4  || timeString.count == 5 ){
            
            let dateFormat = DateFormatter()
            dateFormat.dateFormat = "HH:mm"
            let date = dateFormat.date(from: timeString) ?? Date()
            dateFormat.dateFormat = "hh:mm a"
            return dateFormat.string(from: date)
        }
        return timeString
        
        
        
    }
    
    //    class func AESCheck(dict:NSDictionary) -> NSDictionary{
    //
    //        let dictTemp = dict.mutableCopy() as! NSMutableDictionary
    //        if  let encripted_keys = dictTemp["encripted_keys"] as? NSArray{
    //            for key in dictTemp.allKeys {
    //                if encripted_keys.contains(key){
    //                    if key is String {
    //                        print("Encode:-\n" + "\(dictTemp[key] as! String)")
    //                        //  dictTemp[key] = AESCrypt.decrypt(AESCrypt.encryptString("Hello How are you?"))
    //                        print("Decode:-\n" + AESCrypt.decrypt(dictTemp[key] as! String))
    //                    }
    //                }
    //
    //            }
    //        }
    //
    //        let dict = dictTemp as NSDictionary
    //        return dict
    //    }
    
    
    
    class func atributeString(word:String,fullString:String) -> NSMutableAttributedString{
        
        let font = UIFont.systemFont(ofSize: 15)
        
        if word == "" {
            
            let attributedString = NSMutableAttributedString(string: fullString, attributes: [NSAttributedStringKey.font : font,NSAttributedStringKey.foregroundColor :UIColor.green])
            return attributedString
            
        }
        let wordRange = (fullString as NSString).range(of: word)
        
        
        let attributedString = NSMutableAttributedString(string: fullString, attributes: [NSAttributedStringKey.font : font,NSAttributedStringKey.foregroundColor :UIColor.green])
        
        attributedString.setAttributes([NSAttributedStringKey.font : font, NSAttributedStringKey.foregroundColor : UIColor.red], range: wordRange)
        
        
        return attributedString
    }
    
    //MARK:- COMMON ALERT
    class func showSimplePermissionAlert(title:String,message:String,controller:UIViewController,TYPE:BUTTON_TYPE){
        let ac = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        
            
            if(TYPE == .Normal){
                
                let okAction = UIAlertAction(title: "Ok", style: .default, handler: nil)
                ac.addAction(okAction)
                
            }else if(TYPE == .WithSetting)
            {
                let okAction = UIAlertAction(title: "Ok", style: .destructive) { (alert) in
                    
                    guard let settingsUrl = URL(string: UIApplicationOpenSettingsURLString) else {
                        return
                    }
                    if UIApplication.shared.canOpenURL(settingsUrl) {
                        UIApplication.shared.open(settingsUrl, completionHandler: { (success) in
                            print("Settings opened: \(success)") // Prints true
                        })
                    }
                    
                 }
                ac.addAction(okAction)
            }
            controller.present(ac, animated: true)
    }
}


class CurrencyFormatter: NumberFormatter {
    
    class func setCurrency(_ string:Any?) -> String?{
        
        var price = 0.0
        if string is String{
            price = Double(string as! String) ?? 0
        }
        else if string is Double{
            price = string as! Double
        }
        let numberFormatter = NumberFormatter()
        numberFormatter.locale = Locale(identifier: "en_IN") //en_US
        numberFormatter.maximumFractionDigits = 2
        numberFormatter.minimumFractionDigits = 2
        numberFormatter.alwaysShowsDecimalSeparator = true
        numberFormatter.numberStyle = .currency
        return numberFormatter.string(from: NSNumber.init(value:price))
        
    }
}


//MARK:- NEW MTHODS



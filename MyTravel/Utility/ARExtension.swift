//
//  ARExtension.swift
//  BachelorBasket
//
//  Created by Apple on 15/06/18.
//  Copyright © 2018 Emple. All rights reserved.
//

import Foundation
import UIKit

//extension UIButton{
//    @IBInspectable var cornerRadius: CGFloat
//    {
//        set{
//            layer.cornerRadius = newValue
//        }get{
//            return layer.cornerRadius
//        }
//    }
//}

@IBDesignable
class ARButton : UIButton{
    
    @IBInspectable var cornerRadius: CGFloat = 5.0{
        didSet{
            layer.cornerRadius = cornerRadius
            layer.masksToBounds = cornerRadius > 0
        }
    }
    
    @IBDesignable
    class LeftAlignedIconButton: UIButton {
        override func titleRect(forContentRect contentRect: CGRect) -> CGRect {
            let titleRect = super.titleRect(forContentRect: contentRect)
            let imageSize = currentImage?.size ?? .zero
            let availableWidth = contentRect.width - imageEdgeInsets.right - imageSize.width - titleRect.width
            return titleRect.offsetBy(dx: round(availableWidth / 2), dy: 0)
        }
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        if imageView != nil {
            imageEdgeInsets = UIEdgeInsets(top: 5, left: 15, bottom: 5, right: (bounds.width - 45))
            titleEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: (imageView?.frame.width)!)
        }
    }
}

class ButtonWithImage: UIButton {
    
    
}
@IBDesignable
class RoundTextField : UITextField {
    @IBInspectable var cornerRadius : CGFloat = 0{
        didSet{
            layer.cornerRadius = cornerRadius
            layer.masksToBounds = cornerRadius > 0
        }
    }
    
    @IBInspectable var borderWidth : CGFloat = 0 {
        didSet{
            layer.borderWidth = borderWidth
        }
    }
    
    @IBInspectable var borderColor : UIColor? {
        didSet {
            layer.borderColor = borderColor?.cgColor
        }
    }
    
    @IBInspectable var bgColor : UIColor? {
        didSet {
            backgroundColor = bgColor
        }
    }
    
    @IBInspectable var leftImage : UIImage? {
        didSet {
            if let image = leftImage{
                leftViewMode = .always
                let imageView = UIImageView(frame: CGRect(x: 20, y: 0, width: image.size.width, height: image.size.height))
                imageView.image = image
                imageView.tintColor = tintColor
                let view = UIView(frame : CGRect(x: 0, y: 0, width: image.size.width, height: image.size.height))
                view.addSubview(imageView)
                leftView = view
            }else {
                leftViewMode = .never
            }
            
        }
    }
    
    @IBInspectable var placeholderColor : UIColor? {
        didSet {
            let rawString = attributedPlaceholder?.string != nil ? attributedPlaceholder!.string : ""
            let str = NSAttributedString(string: rawString, attributes: [NSAttributedStringKey.foregroundColor : placeholderColor!])
            attributedPlaceholder = str
        }
    }
    
    override func textRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.insetBy(dx: 50, dy: 5)
    }
    
    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.insetBy(dx: 50, dy: 5)
    }
    
}
extension UIView{
    func dropShadow() {
        
        self.layer.shadowColor = UIColor.gray.cgColor
        self.layer.shadowOpacity = 0.5
        self.layer.shadowOffset = CGSize.zero
        self.layer.shadowRadius = 5
    }
    
    func rotate(_ toValue: CGFloat, duration: CFTimeInterval = 0.2) {
        let animation = CABasicAnimation(keyPath: "transform.rotation")
        
        animation.toValue = toValue
        animation.duration = duration
        animation.isRemovedOnCompletion = false
        animation.fillMode = kCAFillModeForwards
        
        self.layer.add(animation, forKey: nil)
    }
}
extension UIViewController {
    
    func showNavigationBar(){
        
        self.navigationController?.setNavigationBarHidden(false, animated: true)
        self.navigationController?.navigationBar.tintColor = UIColor.white
        // self.navigationController?.navigationBar.barTintColor = COLOR.appGeen
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedStringKey.foregroundColor: UIColor.gray,NSAttributedStringKey.font:UIFont.systemFont(ofSize: FontSizes.H5.fontSize())]
        self.navigationController?.navigationBar.isTranslucent = false;
        self.navigationController?.interactivePopGestureRecognizer?.isEnabled = true
        self.navigationController?.interactivePopGestureRecognizer?.delegate = nil
    }
    func showNavigationBarWithBack(){
        
        self.navigationController?.setNavigationBarHidden(false, animated: true)
        self.navigationController?.navigationBar.tintColor = UIColor.white
     
        self.navigationController?.navigationBar.isTranslucent = false;
        self.navigationController?.interactivePopGestureRecognizer?.isEnabled = true
        self.navigationController?.interactivePopGestureRecognizer?.delegate = nil
    
        let backItem = UIBarButtonItem.init(image:#imageLiteral(resourceName: "back") , style: .plain, target: self, action: #selector(UIViewController.backViewController))
        backItem.tintColor = UIColor.gray
        self.navigationItem.leftBarButtonItem = backItem
    
        //    self.navigationController?.navigationBar.barTintColor = COLOR.appGeen
        //    self.navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.white,NSFontAttributeName:UIFont.app_reguler(withSize: FONTSIZE.regulerSize)]
    }
    
    
    func showNavigationBarWithMultipleLeftButton(firstSelector:Selector,secondSelector:Selector,secondItemImage:UIImage?){
        
        self.navigationController?.setNavigationBarHidden(false, animated: true)
        self.navigationController?.navigationBar.tintColor = UIColor.gray
        
        self.navigationController?.navigationBar.isTranslucent = false;
        self.navigationController?.interactivePopGestureRecognizer?.isEnabled = true
        self.navigationController?.interactivePopGestureRecognizer?.delegate = nil
        
        let editButton   = UIBarButtonItem(image: #imageLiteral(resourceName: "back"),  style: .plain, target: self, action: firstSelector)
        editButton.tintColor = UIColor.gray
        
        let btn = UIButton(frame: CGRect(x: 0, y: 0, width: 30, height: 30))
        btn.layer.cornerRadius = (btn.frame.size.height/2)
        btn.layer.masksToBounds = true
        btn.layer.borderWidth = 0.5
        btn.layer.borderColor = UIColor.gray.cgColor
        btn.setImage(secondItemImage, for: .normal)
        btn.imageView?.contentMode = .scaleAspectFit
        
        let item2 = UIBarButtonItem(customView: btn)
        let currWidth = item2.customView?.widthAnchor.constraint(equalToConstant: 30)
        currWidth?.isActive = true
        let currHeight = item2.customView?.heightAnchor.constraint(equalToConstant: 30)
        currHeight?.isActive = true
        self.navigationItem.setLeftBarButtonItems([editButton,item2], animated: true)
        
    }
    
    func leftBarItem(image:UIImage,name:String?) -> UIBarButtonItem {
        
        let leftItem = UIBarButtonItem.init(image: image, style: .plain, target: self, action: nil)
        leftItem.title = name
        leftItem.tintColor = UIColor.white
        self.navigationItem.leftBarButtonItem = leftItem
        return leftItem
    }
    func rightBarItem(image:UIImage?,name:String?) -> UIBarButtonItem {
        
        let rightItem = UIBarButtonItem.init(image: image, style: .plain, target: self, action: nil)
        rightItem.title = name
        rightItem.tintColor = UIColor.white
        self.navigationItem.rightBarButtonItem = rightItem
        return rightItem
    }
    
    func getBarButtonItem(image:UIImage?,name:String?)  -> UIBarButtonItem {
        
        let rightItem = UIBarButtonItem.init(image: image, style: .plain, target: self, action: nil)
        rightItem.title = name
        rightItem.tintColor = UIColor.white
        return rightItem
        
    }
    @objc func backViewController() {
        if self.navigationController != nil {
            self.navigationController!.popViewController(animated: true)
        }
    }
    func navigationHeight() {
        
        self.view.layoutIfNeeded()
        
    }
    
}


extension String{
    func replace(string:String, replacement:String) -> String {
        return  self.replacingOccurrences(of: string, with: replacement, options: .literal, range: nil)
    }

    func replaceCharacter() -> String {
        return self.replace(string: "'", replacement: "")
    }
    
    func getStringHeight(setStringWidth width:CGFloat, font:UIFont)->CGFloat {
        let size = CGSize(width: width, height: .greatestFiniteMagnitude)
        return self.boundingRect(with: size, options: .usesLineFragmentOrigin, attributes: [kCTFontAttributeName as NSAttributedStringKey : font], context: nil).size.height
    }
    func getStringWidth(setStringHeight height:CGFloat, font:UIFont)->CGFloat {
        let size = CGSize(width: .greatestFiniteMagnitude, height: height)
        return self.boundingRect(with: size, options: .usesLineFragmentOrigin, attributes: [kCTFontAttributeName as NSAttributedStringKey : font], context: nil).size.width
    }
}

extension Int {
    var ordinal: String {
        get {
            var suffix: String = ""
            //            if #available(iOS 9.0, *) {
            //            let c = NumberFormatter()
            //            c.numberStyle = .ordinal // ordinal Style Available from 9.0+
            //            print(c.string(from:5))
            //            }
            //            else {
            let ones: Int = self % 10;
            let tens: Int = (self/10) % 10;
            if (tens == 1) {
                suffix = "th";
            }
            else if ones == 1 {
                suffix = "st";
            } else if ones == 2 {
                suffix = "nd";
            } else if ones == 3 {
                suffix = "rd";
            } else {
                suffix = "th";
            }
            //            }
            return suffix
        }
    }
}


extension UIColor {
    public convenience init?(hexString: String) {
        let r, g, b, a: CGFloat
        
        if hexString.hasPrefix("#") {
            let start = hexString.index(hexString.startIndex, offsetBy: 1)
            let hexColor = String(hexString[start...])
            
            if hexColor.count == 8 {
                let scanner = Scanner(string: hexColor)
                var hexNumber: UInt64 = 0
                
                if scanner.scanHexInt64(&hexNumber) {
                    r = CGFloat((hexNumber & 0xff000000) >> 24) / 255
                    g = CGFloat((hexNumber & 0x00ff0000) >> 16) / 255
                    b = CGFloat((hexNumber & 0x0000ff00) >> 8) / 255
                    a = CGFloat(hexNumber & 0x000000ff) / 255
                    
                    self.init(red: r, green: g, blue: b, alpha: a)
                    return
                }
            }
        }
        
        return nil
    }
}

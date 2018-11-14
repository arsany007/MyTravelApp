//
//  BaseVC.swift
//  ActionTrac
//
//  Created by Apple on 22/09/18.
//  Copyright © 2018 Emple. All rights reserved.
//

import UIKit

class BaseVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    func ShowNavigationBar(backImage:UIImage?,color:UIColor? = themeColorPurple){
        
        self.navigationController?.setNavigationBarHidden(false, animated: true)
        self.navigationController?.navigationBar.tintColor = UIColor.black
        self.navigationController?.navigationBar.barTintColor = color
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedStringKey.foregroundColor : UIColor.black,NSAttributedStringKey.font:AppFont.font_OpenSans_Semibold(size: FontSizes.H3.fontSize())]
        self.navigationController?.navigationBar.isTranslucent = false;
        self.navigationController?.interactivePopGestureRecognizer?.isEnabled = true
        self.navigationController?.interactivePopGestureRecognizer?.delegate = nil
        let backButton = UIBarButtonItem.init(image: backImage , style: .plain, target:self , action: #selector(btnTopbarLeft_Clicked(_:)))
        self.navigationItem.leftBarButtonItem = backButton

        if(backImage == nil){
            self.navigationItem.hidesBackButton = true
        }
        
    }
    
    func getImageFrom(gradientLayer:CAGradientLayer) -> UIImage? {
        var gradientImage:UIImage?
        UIGraphicsBeginImageContext(gradientLayer.frame.size)
        if let context = UIGraphicsGetCurrentContext() {
            gradientLayer.render(in: context)
            gradientImage = UIGraphicsGetImageFromCurrentImageContext()?.resizableImage(withCapInsets: UIEdgeInsets.zero, resizingMode: .stretch)
        }
        UIGraphicsEndImageContext()
        return gradientImage
    }
    @objc func btnTopbarLeft_Clicked(_ sender : UIButton){
//         print("btnTopbarLeft_Clicked from IMD Base View ")
        self.view.endEditing(true)
        //APPDELEGATE.drawer?.open(.left, animated: true, completion: { (Flag) in
            self.navigationController?.popViewController(animated:true)
        //})
        
    }

    func getGredintColor() -> [CGColor]{
        var colorArr = [CGColor]()

        colorArr = [
             UIColor(red: 102.0/255.0, green: 83.0/255.0, blue: 142.0/255.0, alpha: 1.0).cgColor,
             UIColor(red: 112.0/255.0, green: 86.0/255.0, blue: 142.0/255.0, alpha: 1.0).cgColor,
             UIColor(red: 156.0/255.0, green: 99.0/255.0, blue: 142.0/255.0, alpha: 1.0).cgColor,
             UIColor(red: 234.0/255.0, green: 120.0/255.0, blue: 143.0/255.0, alpha: 1.0).cgColor
            ]
        return colorArr
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

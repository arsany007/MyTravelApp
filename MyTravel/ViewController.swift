//
//  ViewController.swift
//  MyTravel
//
//  Created by Apple on 01/10/18.
//  Copyright © 2018 Emple. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var btnAlreadyUser: UIButton!
    @IBOutlet weak var btnRegistration: UIButton!
    @IBOutlet weak var btnLoginWithoutAccount: UIButton!
    @IBOutlet weak var btnSwipe: UIButton!
    @IBOutlet weak var btnMember: UIButton!
    
   
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.navigationController?.navigationBar.isHidden = true
        btnSwipe.layer.cornerRadius = btnSwipe.frame.size.height/2
        btnSwipe.layer.borderWidth = 1.0
        btnSwipe.layer.borderColor = UIColor.gray.cgColor
        btnSwipe.layer.masksToBounds = true
        
        btnSwipe.setNeedsLayout()
        btnSwipe.layoutIfNeeded()
        btnSwipe.imageEdgeInsets = UIEdgeInsets(top: 0.0, left: btnSwipe.frame.size.width * 0.1, bottom: 0.0, right: 0.0)
        
        Helper.underlineButton(btnLoginWithoutAccount)
        Helper.underlineButton(btnMember)
        
        btnAlreadyUser.layer.cornerRadius = btnAlreadyUser.frame.size.height/2
        btnAlreadyUser.layer.masksToBounds = true
        

        btnRegistration.layer.cornerRadius = btnRegistration.frame.size.height/2
        btnRegistration.layer.borderWidth = 1.0
        btnRegistration.layer.borderColor = themeColorDarkBlue.cgColor
        btnRegistration.layer.masksToBounds = true
    }
 
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    @IBAction func btnAlreadyUserAction(_ sender: UIButton) {
        
        let storyboard = UIStoryboard.init(name: "Main", bundle: nil)
        let alreadyUserVC = storyboard.instantiateViewController(withIdentifier: "AlreadyUserVC") as? AlreadyUserVC
        self.navigationController?.pushViewController(alreadyUserVC!, animated: true)
    }
    
    
    @IBAction func btnRegisterAction(_ sender: UIButton) {
        
        let storyboard = UIStoryboard.init(name: "Main", bundle: nil)
        let alreadyUserVC = storyboard.instantiateViewController(withIdentifier: "SignupVC") as? SignupVC
        self.navigationController?.pushViewController(alreadyUserVC!, animated: true)
    }
    
}


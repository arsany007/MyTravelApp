//
//  AlreadyUserVC.swift
//  MyTravel
//
//  Created by Apple on 05/10/18.
//  Copyright © 2018 Emple. All rights reserved.
//

import UIKit

class AlreadyUserVC: UIViewController {
    @IBOutlet weak var btnFacebook: UIButton!
    @IBOutlet weak var btnSignin: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        self.navigationController?.navigationBar.isHidden = true
        
        btnFacebook.layer.cornerRadius = btnFacebook.frame.size.height/2
        btnFacebook.layer.masksToBounds = true
        
        
        btnSignin.layer.cornerRadius = btnSignin.frame.size.height/2
        btnSignin.layer.borderWidth = 1.0
        btnSignin.layer.borderColor = themeColorDarkBlue.cgColor
        btnSignin.layer.masksToBounds = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func btnSignInAction(_ sender: UIButton) {
        
        let storyboard = UIStoryboard.init(name: "Main", bundle: nil)
        let alreadyUserVC = storyboard.instantiateViewController(withIdentifier: "SignInVC") as? SignInVC
        self.navigationController?.pushViewController(alreadyUserVC!, animated: true)
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

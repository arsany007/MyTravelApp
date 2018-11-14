//
//  SignInVC.swift
//  MyTravel
//
//  Created by Apple on 05/10/18.
//  Copyright © 2018 Emple. All rights reserved.
//

import UIKit
import Firebase
import FirebaseDatabase
import FirebaseAuth

class SignInVC: BaseVC {

    @IBOutlet weak var txtFieldUsername: UITextField!
    @IBOutlet weak var txtFieldPassword: UITextField!
    @IBOutlet weak var btnForgorPassword: UIButton!
    @IBOutlet weak var btnSend: UIButton!
    

    override func viewDidLoad() {
        super.viewDidLoad()

        

        // Do any additional setup after loading the view.

        btnSend.setNeedsLayout()
        btnSend.layoutIfNeeded()
        
        btnSend.layer.cornerRadius = btnSend.frame.size.height/2
        btnSend.layer.masksToBounds = true
        btnSend.imageEdgeInsets = UIEdgeInsets(top: 0.0, left: btnSend.frame.size.width * 0.4, bottom: 0.0, right: 0.0)
        
        Helper.underlineButton(btnForgorPassword)
        
        Helper.setPlaceholderWithColor(txtFieldUsername, placeholder: "User Name", color: UIColor.white)
        Helper.setPlaceholderWithColor(txtFieldPassword, placeholder: "Password", color: UIColor.white)        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func btnSendAction(_ sender: UIButton) {
        
//        let storyboard = UIStoryboard.init(name: "Main", bundle: nil)
//        let lastVisitedVC = storyboard.instantiateViewController(withIdentifier: "LastTripVisitedVC") as? LastTripVisitedVC
//        self.navigationController?.pushViewController(lastVisitedVC!, animated: true)
        
        if(checkValidation()){
            
            APPDELEGATE.showIndicator(view: self.view)
            Auth.auth().signIn(withEmail: txtFieldUsername.text!, password: txtFieldPassword.text!) { (result, error) in
                
                APPDELEGATE.hideIndicator(view: self.view)
                
                guard let user = result?.user else {
                    
                    self.view.makeToast(error!.localizedDescription)
                    return
                }
                let userDict = NSMutableDictionary()
                userDict.setValue(user.email!, forKey: "email")
                userDict.setValue(user.uid, forKey: "user_id")
                userDict.setValue(user.isEmailVerified, forKey: "is_email_verified")
                userDict.setValue(user.isAnonymous, forKey: "is_anonymous")
                userDict.setValue(user.refreshToken, forKey: "token")
            
                userDefault(value: userDict, key: USER_DETAILS as NSString)
    
                APPDELEGATE.window!.makeToast("User login successfully")
                APPDELEGATE.moveToFormVC()
            }
            
           
        }
        
        
    }
    
    func checkValidation() -> Bool{
        
        if(txtFieldUsername.text!.isEmpty){
            self.view.makeToast("Please enter email")
            return false
        }
        else if(Validator.validateEmail(txtFieldUsername.text!) == false){
            self.view.makeToast("Please enter valid email")
            return false
        }
        else if(txtFieldPassword.text!.isEmpty){
            self.view.makeToast("Please enter password")
            return false
        }
        else{
            return true
        }
    }
    
    @IBAction func btnForgotPassword(_ sender: UIButton) {
        
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

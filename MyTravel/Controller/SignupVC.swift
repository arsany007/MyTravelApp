//
//  SignupVC.swift
//  MyTravel
//
//  Created by Apple on 05/10/18.
//  Copyright © 2018 Emple. All rights reserved.
//

import UIKit
import FirebaseAuth
import FirebaseDatabase

class SignupVC: UIViewController {

    @IBOutlet weak var txtFieldUsername: UITextField!
    @IBOutlet weak var txtFieldEmail: UITextField!
    @IBOutlet weak var txtFieldPassword: UITextField!
    @IBOutlet weak var txtFieldRepeatPassword: UITextField!
    @IBOutlet weak var btnMember: UIButton!
    @IBOutlet weak var btnSend: UIButton!
    
    
    var ref: DatabaseReference!
    
   
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        self.setUpUIData()
        
    }

    func setUpUIData(){
        
         ref = Database.database().reference()
        
         Helper.setPlaceholderWithColor(txtFieldUsername, placeholder: "User Name", color: UIColor.white)
         Helper.setPlaceholderWithColor(txtFieldEmail, placeholder: "E-Mail", color: UIColor.white)
         Helper.setPlaceholderWithColor(txtFieldPassword, placeholder: "Password", color: UIColor.white)
         Helper.setPlaceholderWithColor(txtFieldRepeatPassword, placeholder: "Retype Password", color: UIColor.white)
        
        Helper.underlineButton(btnMember)
        
        
        btnSend.setNeedsLayout()
        btnSend.layoutIfNeeded()
        btnSend.layer.cornerRadius = btnSend.frame.size.height/2
        btnSend.layer.masksToBounds = true
        btnSend.imageEdgeInsets = UIEdgeInsets(top: 0.0, left: btnSend.frame.size.width * 0.4, bottom: 0.0, right: 0.0)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func btnSendAction(_ sender: UIButton) {
        
        if(checkValidation())
        {
            APPDELEGATE.showIndicator(view: self.view)
            Auth.auth().createUser(withEmail: txtFieldEmail.text!, password: txtFieldPassword.text!) { (authResult, error) in
                
                APPDELEGATE.hideIndicator(view: self.view)
                
                guard let user = authResult?.user else { return }
                print(user)
              
               

                self.ref.child("users").child(user.uid).setValue(["email": user.email!,"uid":user.uid,"username":self.txtFieldUsername.text!])
                

                APPDELEGATE.window?.makeToast("User registerd successfully")
                APPDELEGATE.moveToFormVC()
            }
        }
        
    }
    
    func checkValidation() -> Bool{
        
        if(txtFieldUsername.text!.isEmpty){
            self.view.makeToast("Please enter username")
            return false
        }
        else if(txtFieldEmail.text!.isEmpty){
            self.view.makeToast("Please enter email")
            return false
        }
        else if(Validator.validateEmail(txtFieldEmail.text!) == false){
            self.view.makeToast("Please enter valid email")
            return false
        }
        else if(txtFieldPassword.text!.isEmpty){
            self.view.makeToast("Please enter password")
            return false
        }
        else if(Validator.isPasswordSame(txtFieldPassword.text!, strConfirmPassword: txtFieldRepeatPassword.text!) == false){
            self.view.makeToast("Password does not match")
            return false
        }
        else{
            return true
        }
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

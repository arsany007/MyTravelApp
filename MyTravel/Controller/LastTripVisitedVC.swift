//
//  LastTripVisitedVC.swift
//  MyTravel
//
//  Created by Apple on 06/10/18.
//  Copyright © 2018 Emple. All rights reserved.
//

import UIKit

class LastTripVisitedVC: UIViewController {

    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblDesc: UILabel!
    @IBOutlet weak var btnTourGuild: UIButton!
    @IBOutlet weak var btnPlanTrip: UIButton!
    @IBOutlet weak var btnDiscoverArea: UIButton!
    @IBOutlet weak var btnMainMenu: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
      self.setupData()
        
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.navigationController?.navigationBar.isHidden = true
    }
    func setupData(){
        
        APPDELEGATE.centerContainer?.maximumLeftDrawerWidth = ScreenSize.SCREEN_WIDTH * 0.7
        
        self.navigationController?.navigationBar.isHidden = true
        
        lblTitle.text = "Hello Max, \n nice to see you \n again :)"
        
        btnTourGuild.layer.cornerRadius = btnTourGuild.frame.size.height/2
        btnTourGuild.layer.masksToBounds = true
        
        btnPlanTrip.layer.cornerRadius = btnPlanTrip.frame.size.height/2
        btnPlanTrip.layer.borderWidth = 1.0
        btnPlanTrip.layer.borderColor = themeColorDarkBlue.cgColor
        btnPlanTrip.layer.masksToBounds = true
        
        btnDiscoverArea.layer.cornerRadius = btnDiscoverArea.frame.size.height/2
        btnDiscoverArea.layer.borderWidth = 1.0
        btnDiscoverArea.layer.borderColor = themeColorDarkBlue.cgColor
        btnDiscoverArea.layer.masksToBounds = true
        
        btnMainMenu.setNeedsLayout()
        btnMainMenu.layoutIfNeeded()
        Helper.underlineButton(btnMainMenu)
        btnMainMenu.imageEdgeInsets = UIEdgeInsets(top: 0.0, left: 0.0, bottom: 0.0, right: btnMainMenu.frame.size.width * 0.05)
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func btnTourGuideAction(_ sender: UIButton) {
        
    }
    @IBAction func btnPlanTripAction(_ sender: UIButton) {
    }
    
    @IBAction func btnDiscoverAction(_ sender: UIButton) {
    }
    @IBAction func btnMainMenuAction(_ sender: UIButton) {
        
        let storyboard = UIStoryboard.init(name: "Main", bundle: nil)
        let homeVC = storyboard.instantiateViewController(withIdentifier: "HomeVC") as? HomeVC
        self.navigationController?.pushViewController(homeVC!, animated: true)
    }
    @IBAction func btnMenuAction(_ sender: UIButton) {
        APPDELEGATE.centerContainer?.open(.left, animated: true, completion: nil)
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

//
//  HomeVC.swift
//  MyTravel
//
//  Created by Apple on 08/10/18.
//  Copyright © 2018 Emple. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth

class HomeVC: BaseVC,UITableViewDelegate,UITableViewDataSource {

    @IBOutlet weak var tblView: UITableView!
    
    var ref: DatabaseReference!
    
    var arrTrip = [TripObject]()
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.ShowNavigationBar(backImage: #imageLiteral(resourceName: "menu_icon"), color: UIColor.white)
        self.title = "Dashboard"
        
        ref = Database.database().reference()
        
        getTripData()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.navigationController?.navigationBar.isHidden = false
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func getTripData(){
        
        APPDELEGATE.showIndicator(view: self.view)
        ref.child("trips").observeSingleEvent(of: .value, with: { (snapshot) in
            
            APPDELEGATE.hideIndicator(view: self.view)
            // Get user value
            if let dictData = snapshot.value as? NSDictionary{
                for key in dictData.allKeys{
                    self.arrTrip.append(TripObject.init(dictionary: dictData.value(forKey: key as! String) as! NSDictionary)!)
                }
                print("COUNT:",self.arrTrip.count)
                self.tblView.reloadData()
            }
            
            
        }) { (error) in
            
            APPDELEGATE.hideIndicator(view: self.view)
            print(error.localizedDescription)
        }
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrTrip.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let Cell = tableView.dequeueReusableCell(withIdentifier: "UpcomingTripCell") as? UpcomingTripCell
        let objTrip = arrTrip[indexPath.row]
        Cell?.setUpData(obj: objTrip)
        return Cell!
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        let headerView = UIView()
        headerView.translatesAutoresizingMaskIntoConstraints = false
        headerView.backgroundColor = themeColorDarkBlue
        self.view.addSubview(headerView)
        
        let lblTitle = UILabel()
        lblTitle.translatesAutoresizingMaskIntoConstraints = false
        lblTitle.text = "Upcoming Trips"
        lblTitle.font = AppFont.font_OpenSans_Semibold(size: FontSizes.H6.fontSize())
        lblTitle.textColor = UIColor.white
        headerView.addSubview(lblTitle)
        
        self.view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[headerView]|", options: [], metrics: nil, views: ["headerView":headerView]))
        self.view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[headerView]", options: [], metrics: nil, views: ["headerView":headerView]))
        
        headerView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-15-[lblTitle]-|", options: [], metrics: nil, views: ["lblTitle":lblTitle]))
        headerView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-[lblTitle]-|", options: [], metrics: nil, views: ["lblTitle":lblTitle]))
        
        return headerView
    }
    
    override func btnTopbarLeft_Clicked(_ sender: UIButton) {
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

//
//  LeftMenuVC.swift
//  ActionTrac
//
//  Created by Apple on 22/09/18.
//  Copyright © 2018 Emple. All rights reserved.
//

import UIKit
import MMDrawerController

class LeftMenuVC: BaseVC,UITableViewDelegate,UITableViewDataSource {

    //MARK:- PROPERTY
    @IBOutlet weak var tblView: UITableView!
    
    //MARK:- VIEW LIFE CYCLE METHODS
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        tblView.estimatedRowHeight = UITableViewAutomaticDimension
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK:- TABLEVIEW DELEGATE/DATASOURCE METHODS
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "LeftMenuCell") as? LeftMenuCell
        
        let arr = MenuManager.getMenuArray()
        
        let obj = arr[indexPath.row] as? NSDictionary
        cell?.lblMenuTitle.text = obj?.value(forKey: "title") as? String
        cell?.imgMenuIcon.image = UIImage(named:(obj?.value(forKey: "image") as? String)!)
        
        return cell!
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return MenuManager.getMenuArray().count
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let arr = MenuManager.getMenuArray()
        print(arr[indexPath.row])
        
        APPDELEGATE.centerContainer?.closeDrawer(animated: true, completion: nil)
        let navigation =  APPDELEGATE.centerContainer?.centerViewController as? UINavigationController;

        if(indexPath.row == 1)
        {
            let storyboard = UIStoryboard.init(name: "Main", bundle: nil)
            let nominatedListVC = storyboard.instantiateViewController(withIdentifier: "DiscoverVC") as! DiscoverVC
            navigation?.pushViewController(nominatedListVC, animated: true)
        }
        if(indexPath.row == 2){
//            let storyboard = UIStoryboard.init(name: "Main", bundle: nil)
//            let nominatedListVC = storyboard.instantiateViewController(withIdentifier: "NominatedListVC") as! NominatedListVC
//            navigation?.pushViewController(nominatedListVC, animated: true)
        }
        if(indexPath.row == 3){
//            let storyboard = UIStoryboard.init(name: "Main", bundle: nil)
//            let inboxVC = storyboard.instantiateViewController(withIdentifier: "InboxVC") as! InboxVC
//            navigation?.pushViewController(inboxVC, animated: true)
        }
        if(indexPath.row == 4){
            
//            let alertController = UIAlertController(title: "Logout", message: "Are you sure you want to logout?", preferredStyle: .alert)
//            
//            let okAction = UIAlertAction(title: "Ok", style: .default) { (alert) in
//                
//                 Helper.clearUserDefults()
//                
//                //APPDELEGATE.moveToSignInScreen()
//                
//            }
//            
//            let cancelAction = UIAlertAction(title: "Cancel", style: .destructive, handler: nil)
//            alertController.addAction(okAction)
//            alertController.addAction(cancelAction)
//            
//            self.present(alertController, animated: true, completion: nil)
            
        }
        
        let cell:LeftMenuCell = tblView.cellForRow(at: indexPath) as! LeftMenuCell
       
        cell.contentView.backgroundColor = UIColor.clear
        let layer = UIView(frame: CGRect(x: 0, y: 246, width: 200, height: 61))
        layer.alpha = 0.20
        
        let gradient = CAGradientLayer()
        gradient.frame = CGRect(x: 0, y: 0, width: ScreenSize.SCREEN_WIDTH * 0.62, height: 61)
        gradient.colors = [
            themeColorDarkBlue.cgColor,
            UIColor(red:133.0, green:183.0, blue:190.0, alpha:0).cgColor
        ]
        gradient.locations = [0, 1]
        gradient.startPoint = CGPoint(x: 0, y: 0.5)
        gradient.endPoint = CGPoint(x: 1, y: 0.5)
        layer.layer.addSublayer(gradient)
        cell.selectedBackgroundView = layer

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

//MARK:- TABLEVIEW CELL CLASS
class LeftMenuCell: UITableViewCell {
    
    
    @IBOutlet weak var imgMenuIcon: UIImageView!
    @IBOutlet weak var lblMenuTitle: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
//        lblMenuTitle.font = UIFont.systemFont(ofSize: FontSizes.H6.fontSize())
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
}


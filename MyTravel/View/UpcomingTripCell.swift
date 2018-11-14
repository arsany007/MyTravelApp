//
//  UpcomingTripCell.swift
//  MyTravel
//
//  Created by Apple on 08/10/18.
//  Copyright © 2018 Emple. All rights reserved.
//

import UIKit

class UpcomingTripCell: UITableViewCell {

    @IBOutlet weak var lblTripDate: UILabel!
    @IBOutlet weak var imgViewTrip: UIImageView!
    @IBOutlet weak var lblCity: UILabel!
    @IBOutlet weak var lblLocation: UILabel!
    @IBOutlet weak var lblDays: UILabel!
    @IBOutlet weak var lblTraveller: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        imgViewTrip.image = #imageLiteral(resourceName: "placeholder")
    }

    
    func setUpData(obj:TripObject){
        
        lblTripDate.text = "Trip Date: \(obj.starttDate!)"
        lblCity.text = obj.name
        lblLocation.text = "\(obj.loationObj.count) Location"
        
        
        
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

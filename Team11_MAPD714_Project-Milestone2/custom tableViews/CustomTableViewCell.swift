//
//  CustomTableViewCell.swift
//  Team11_MAPD714_Project-Milestone2
//
//  Created by SAURAV on 2023-11-11.
//

// Team 11
// Saurav Gautam - 301286980
// Nibha Maharjan - 301282952
//
// Project- 1
// Milestone - 4
//
// This is project on Cruise booking app. We have to create UI and functionality from scratch using everything we
// learned in class and other resources found via books or online.




import UIKit

class CustomTableViewCell: UITableViewCell {
    
    
    
    @IBOutlet weak var cruiseUIView: UIView!
    
    
    @IBOutlet weak var cruiseImg: UIImageView!
    
    @IBOutlet weak var cruiseName: UILabel!
    
    @IBOutlet weak var cruiseDetail: UILabel!
    
    @IBOutlet weak var cruiseDestination: UILabel!
    
    @IBOutlet weak var cruisePrice: UILabel!
    
    
    @IBOutlet weak var perPerson: UILabel!
    
    
//    override func awakeFromNib() {
//        super.awakeFromNib()
//        // Initialization code
//    }
//
//    override func setSelected(_ selected: Bool, animated: Bool) {
//        super.setSelected(selected, animated: animated)
//
//        // Configure the view for the selected state
//    }

}

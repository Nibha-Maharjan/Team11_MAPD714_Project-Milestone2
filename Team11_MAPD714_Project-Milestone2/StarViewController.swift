//
//  StarViewController.swift
//  Team11_MAPD714_Project-Milestone2
//
//  Created by SAURAV on 2023-11-12.
//

import UIKit

class StarViewController: UIViewController {

    
    @IBOutlet weak var starCruiseNamelbl: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    
    func dataCruiseName() {
        
            starCruiseNamelbl.text = "Star Cruise"
            
        }
    
    @IBAction func buttonClickedStar(_ sender: UIButton) {
        
        let dataSnd = self.storyboard?.instantiateViewController(withIdentifier: "PassengerCountViewController") as! PassengerCountViewController
        
        
        
        dataSnd.CruiseLbldata = starCruiseNamelbl.text!
        
        
        self.navigationController?.pushViewController(dataSnd, animated: true)
        
    }
    
}

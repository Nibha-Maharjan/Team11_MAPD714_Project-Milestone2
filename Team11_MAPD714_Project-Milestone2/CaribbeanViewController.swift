//
//  CaribbeanViewController.swift
//  Team11_MAPD714_Project-Milestone2
//
//  Created by SAURAV on 2023-11-12.
//

import UIKit

class CaribbeanViewController: UIViewController {

    @IBOutlet weak var caribbeanCruiseNameLbl: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    
    func dataCruiseName() {
        
            caribbeanCruiseNameLbl.text = "Caribbean Cruise"
            
        }
    
    
    @IBAction func buttonClickedCaribbean(_ sender: UIButton) {
        
        let dataSnd = self.storyboard?.instantiateViewController(withIdentifier: "PassengerCountViewController") as! PassengerCountViewController
        
        
        
        dataSnd.CruiseLbldata = caribbeanCruiseNameLbl.text!
        
        
        self.navigationController?.pushViewController(dataSnd, animated: true)
        
    }
    


}

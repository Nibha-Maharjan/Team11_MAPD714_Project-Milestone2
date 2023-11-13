//
//  BahamasViewController.swift
//  Team11_MAPD714_Project-Milestone2
//
//  Created by SAURAV on 2023-11-12.
//

import UIKit

class BahamasViewController: UIViewController {

    
    @IBOutlet weak var bahamasCruiseLbl: UILabel!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    func dataCruiseName() {
        
            bahamasCruiseLbl.text = "Bahamas Cruise"
            
        }

    @IBAction func buttonClickBahamas(_ sender: UIButton) {
        let dataSnd = self.storyboard?.instantiateViewController(withIdentifier: "PassengerCountViewController") as! PassengerCountViewController
        
        
        
        dataSnd.CruiseLbldata = bahamasCruiseLbl.text!
        
        
        self.navigationController?.pushViewController(dataSnd, animated: true)
        
    }
    
}

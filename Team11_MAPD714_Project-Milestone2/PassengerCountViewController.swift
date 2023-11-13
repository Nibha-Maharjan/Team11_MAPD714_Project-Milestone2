//
//  PassengerCountViewController.swift
//  Team11_MAPD714_Project-Milestone2
//
//  Created by SAURAV on 2023-11-12.
//

import UIKit

class PassengerCountViewController: UIViewController {

    
    @IBOutlet weak var cruiseSelectedPassengerCountLbl: UILabel!
    
    
    var CruiseLbldata = ""
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        cruiseSelectedPassengerCountLbl.text = "You have selected:  \(CruiseLbldata)"
    }
    

    @IBAction func buttonClickedPersonCountNext(_ sender: UIButton) {
        
        let dataSndCount = self.storyboard?.instantiateViewController(withIdentifier: "PaymentViewController") as! PaymentViewController

        
        self.navigationController?.pushViewController(dataSndCount, animated: true)
        
    }
    

}

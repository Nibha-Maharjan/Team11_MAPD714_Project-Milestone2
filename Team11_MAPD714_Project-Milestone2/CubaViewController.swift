//
//  CubaViewController.swift
//  Team11_MAPD714_Project-Milestone2
//
//  Created by SAURAV on 2023-11-12.
//

import UIKit

class CubaViewController: UIViewController {

    @IBOutlet weak var cubaCruiseNamelbl: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    
    func dataCruiseName() {
        
            cubaCruiseNamelbl.text = "Cuba Cruise"
            
        }
    
    
    @IBAction func buttonClickedCuba(_ sender: UIButton) {
        
        let dataSnd = self.storyboard?.instantiateViewController(withIdentifier: "PassengerCountViewController") as! PassengerCountViewController
        
        
        
        dataSnd.CruiseLbldata = cubaCruiseNamelbl.text!
        
        
        self.navigationController?.pushViewController(dataSnd, animated: true)
        
    }
    

}

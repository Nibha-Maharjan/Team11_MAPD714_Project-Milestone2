//
//  SamplerViewController.swift
//  Team11_MAPD714_Project-Milestone2
//
//  Created by SAURAV on 2023-11-12.
//

import UIKit

class SamplerViewController: UIViewController {

    
    @IBOutlet weak var samplerCruiseNamelbl: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    
    func dataCruiseName() {
        
            samplerCruiseNamelbl.text = "Sampler Cruise"
            
        }
    
    @IBAction func buttonClickedSampler(_ sender: UIButton) {
        
        let dataSnd = self.storyboard?.instantiateViewController(withIdentifier: "PassengerCountViewController") as! PassengerCountViewController
        
        
        
        dataSnd.CruiseLbldata = samplerCruiseNamelbl.text!
        
        
        self.navigationController?.pushViewController(dataSnd, animated: true)
        
    }
    
    

}

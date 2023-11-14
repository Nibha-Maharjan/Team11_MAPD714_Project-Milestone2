//
//  SamplerViewController.swift
//  Team11_MAPD714_Project-Milestone2
//
//  Created by SAURAV on 2023-11-12.
//
// Team 11
// Saurav Gautam - 301286980
// Nibha Maharjan - 301282952
//
// Project- 1
// Milestone - 3
//
// This is project on Cruise booking app. We have to create UI and functionality from scratch using everything we
// learned in class and other resources found via books or online.



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

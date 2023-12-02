//
//  CaribbeanViewController.swift
//  Team11_MAPD714_Project-Milestone2
//
//  Created by SAURAV on 2023-11-12.
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

class CaribbeanViewController: UIViewController {

    @IBOutlet weak var caribbeanCruiseNameLbl: UILabel!
    
    @IBOutlet weak var caprice: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    
    func dataCruiseName() {
        
            caribbeanCruiseNameLbl.text = "Caribbean Cruise"
            
        }
    
    func dataCruisePrice() {
        caprice.text = "1500"
        }
    
    
    
    
    @IBAction func buttonClickedCaribbean(_ sender: UIButton) {
        
        let dataSnd = self.storyboard?.instantiateViewController(withIdentifier: "PassengerCountViewController") as! PassengerCountViewController
        
        
        
        dataSnd.CruiseLbldata = caribbeanCruiseNameLbl.text!
        dataSnd.CruisePrice = caprice.text!
        
        //self.navigationController?.pushViewController(dataSnd, animated: true)
        
        present(dataSnd,animated: true)
        
    }
    


}

//
//  OutputViewController.swift
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

class OutputViewController: UIViewController {
    @IBOutlet weak var cusName: UILabel!
    
    @IBOutlet weak var cusAdd: UILabel!
    @IBOutlet weak var cusCruise: UILabel!
    @IBOutlet weak var cusPlace: UILabel!
    @IBOutlet weak var cusDuration: UILabel!
    @IBOutlet weak var cusGuest: UILabel!
    @IBOutlet weak var cusNight: UILabel!
    @IBOutlet weak var cusPrice: UILabel!
    var GuestNum: String?
    var GuestName: String?
    var GuestAdd: String?
    override func viewDidLoad() {
        super.viewDidLoad()
        
        cusName.text="Name: \(GuestName!)"
        cusAdd.text="Address: \(GuestAdd!)"
        cusCruise.text="Cruise: Bahama"
        cusDuration.text="2 Weeks"
        cusGuest.text="No of guests: \(GuestNum!)"
        cusNight.text="Duration: 7 Nights and 6 Days"
        cusPrice.text="Total Price: $6400"
    }
    
    @IBAction func buttonClickedReturnHome(_ sender: UIButton) {
        
        let dataSndOutput = self.storyboard?.instantiateViewController(withIdentifier: "ViewController") as! ViewController

        
        self.navigationController?.pushViewController(dataSndOutput, animated: true)
        
    }
    

}

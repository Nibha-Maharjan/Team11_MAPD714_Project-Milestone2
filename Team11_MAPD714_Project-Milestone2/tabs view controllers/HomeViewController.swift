//
//  HomeViewController.swift
//  Team11_MAPD714_Project-Milestone2
//
//  Created by SAURAV on 2023-10-29.
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
//
// Cruise app will have several views for various functionality.
// there is splash screen, a starting screen which has buttons for browse, login and register.
// there is tabs for featured which is the home screen then other tabs for deals, search, saved and account.
// there are individual pages for cruises.

import UIKit

class HomeViewController: UIViewController {

    
    @IBOutlet weak var cruiseTableView: UITableView!
    
    
//    var cruiseData: [Cruise] = [
//        Cruise(name: "Bahamas Cruise", destination: "Nassau, Bahamas", pickupLocation: "Miami, FL", price: 1200.0, numberOfNights: 7),
//        Cruise(name: "Caribbean Cruise", destination: "St. Thomas, Barbados, Antigua", pickupLocation: "Miami, FL", price: 1500.0, numberOfNights: 10),
//        Cruise(name: "Cuba Cruise", destination: "Havana, Cuba", pickupLocation: "Tampa, FL", price: 900.0, numberOfNights: 5),
//        Cruise(name: "Sampler Cruise", destination: "Cozumel, Mexico", pickupLocation: "Galveston, TX", price: 800.0, numberOfNights: 4),
//        Cruise(name: "Star Cruise", destination: "Port Canaveral, FL", pickupLocation: "Orlando, FL", price: 700.0, numberOfNights: 3)
//    ]
    
    
    //arrays for the cruise datas
    let cruises = ["Bahamas Cruise", 
                   "Caribbean Cruise",
                   "Cuba Cruise",
                   "Sampler Cruise",
                   "Star Cruise"]
    
    let cruisesPhotos = ["BahamasFeatured", 
                         "CaribbeanFeatured",
                         "CubaFeatured",
                         "SamplerFeatured",
                         "StarFeatured"]
    
    let cruisesInfos = ["7 Nights in the luxurious Bahamas Cruise",
                        "10 Nights in the luxurious Caribbean Cruise",
                        "5 Nights in the luxurious Cuba Cruise",
                        "4 Nights in the luxurious Sampler Cruise",
                        "3 Nights in the luxurious Star Cruise"]
    
    let cruisesDestinations = ["Miami, FL to Nassau, Bahamas",
                               "Miami, FL to St. Thomas, Barbados, Antigua",
                               "Tampa, FL to Havana, Cuba",
                               "Galveston, TX to Cozumel, Mexico",
                               "Orlando, FL to Port Canaveral, FL"]
    
    let cruisesPrices = ["$1200",
                         "$1500",
                         "$900",
                         "$800",
                         "$700"]
    
    let personCount = ["*per person","*per person","*per person","*per person","*per person"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        cruiseTableView.delegate = self
        cruiseTableView.dataSource = self
    }
    
}

//extension for view controller to implement table view
extension HomeViewController: UITableViewDelegate, UITableViewDataSource{
    
    //custom cell height
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 480
    }
    
    //number of rows
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cruises.count
    }
    
    //data to be passed in custom cells
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = cruiseTableView.dequeueReusableCell(withIdentifier: "customCell") as! CustomTableViewCell
        
        //getting the outlets from CustomTableViewCell class file and passing array data into it
        let cruisePhoto = cruisesPhotos[indexPath.row]
        cell.cruiseImg.image = UIImage(named: cruisePhoto)
        
        
        let cruiseNames = cruises[indexPath.row]
        cell.cruiseName.text = cruiseNames

        
        let cruiseInfo = cruisesInfos[indexPath.row]
        cell.cruiseDetail.text = cruiseInfo
        
        let cruiseDestinations = cruisesDestinations[indexPath.row]
        cell.cruiseDestination.text = cruiseDestinations
        
        let cruisePrices = cruisesPrices[indexPath.row]
        cell.cruisePrice.text = cruisePrices
        
        let personCounts = personCount[indexPath.row]
        cell.perPerson.text = personCounts
        
        return cell
    }
    
    
    //onselect function for the custom cells
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        var segueIdentifier = String()
        switch indexPath.row{
        
        case 0:
            segueIdentifier = "showBahamas"
            
        case 1:
            segueIdentifier = "showCaribbean"
            
        case 2:
            segueIdentifier = "showCuba"
            
        case 3:
            segueIdentifier = "showSampler"
            
        default:
            segueIdentifier = "showStar"
        }
        self.performSegue(withIdentifier: segueIdentifier, sender: self)
    }
}

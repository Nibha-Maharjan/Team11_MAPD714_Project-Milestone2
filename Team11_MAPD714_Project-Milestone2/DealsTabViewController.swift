//
//  DealsTabViewController.swift
//  Team11_MAPD714_Project-Milestone2
//
//  Created by SAURAV on 2023-10-30.
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
//
// Cruise app will have several views for various functionality.
// there is splash screen, a starting screen which has buttons for browse, login and register.
// there is tabs for featured which is the home screen then other tabs for deals, search, saved and account.
// there are individual pages for cruises.



// manage the deals


import UIKit

class DealsTabViewController: UIViewController {

    
    @IBOutlet weak var tableViewCruiseDeals: UITableView!
    
//    // Define a custom struct for Cruise data
//    struct Cruise {
//        var name: String
//        var destination: String
//        var pickupLocation: String
//        var price: Double
//        var numberOfNights: Int
//    }
//    
//    // Create an array of Cruise data
//    var cruiseData: [Cruise] = [
//        Cruise(name: "Bahamas Cruise", destination: "Nassau, Bahamas", pickupLocation: "Miami, FL", price: 1200.0, numberOfNights: 7),
//        Cruise(name: "Caribbean Cruise", destination: "St. Thomas, Barbados, Antigua", pickupLocation: "Miami, FL", price: 1500.0, numberOfNights: 10),
//        Cruise(name: "Cuba Cruise", destination: "Havana, Cuba", pickupLocation: "Tampa, FL", price: 900.0, numberOfNights: 5),
//        Cruise(name: "Sampler Cruise", destination: "Cozumel, Mexico", pickupLocation: "Galveston, TX", price: 800.0, numberOfNights: 4),
//        Cruise(name: "Star Cruise", destination: "Port Canaveral, FL", pickupLocation: "Orlando, FL", price: 700.0, numberOfNights: 3)
//    ]
    
    
    //arrays for the cruise datas
    let cruises = ["Star Cruise",
                   "Sampler Cruise",
                   "Cuba Cruise",
                   "Bahamas Cruise",
                   "Caribbean Cruise"]
    
    let cruisesPhotos = ["StarFeatured",
                         "SamplerFeatured",
                         "CubaFeatured",
                         "BahamasFeatured",
                         "CaribbeanFeatured"]
    
    let cruisesInfos = ["3 Nights in the luxurious Star Cruise",
                        "4 Nights in the luxurious Sampler Cruise",
                        "5 Nights in the luxurious Cuba Cruise",
                        "7 Nights in the luxurious Bahamas Cruise",
                        "10 Nights in the luxurious Caribbean Cruise"]
    
    let cruisesDestinations = ["Orlando, FL to Port Canaveral, FL",
                               "Galveston, TX to Cozumel, Mexico",
                               "Tampa, FL to Havana, Cuba",
                               "Miami, FL to Nassau, Bahamas",
                               "Miami, FL to St. Thomas, Barbados, Antigua"]
    
    let cruisesPrices = ["$700",
                         "$800",
                         "$900",
                         "$1200",
                         "$1500"]
    
    let personCount = ["*per person","*per person","*per person","*per person","*per person"]
    
    let topDealsNoteRight = ["Top Deals Guaranteed", "Top Deals Guaranteed", "Top Deals Guaranteed", "Top Deals Guaranteed", "Top Deals Guaranteed"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableViewCruiseDeals.delegate = self
        tableViewCruiseDeals.dataSource = self
    }
    
}

//    override func viewDidLoad() {
//        super.viewDidLoad()
//        
//        tableViewCruiseDeals?.dataSource = self
//    }
    
//extension for view controller to implement table view
extension DealsTabViewController: UITableViewDelegate, UITableViewDataSource{
    
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
        let cell = tableViewCruiseDeals.dequeueReusableCell(withIdentifier: "cellDeals") as! CustomDealsTableViewCell
        
        //getting the outlets from CustomTableViewCell class file and passing array data into it
        let DealsCruisePhoto_ = cruisesPhotos[indexPath.row]
        cell.dealsCruiseImg.image = UIImage(named: DealsCruisePhoto_)
        
        
        let dealsCruiseNames_ = cruises[indexPath.row]
        cell.dealsCruiseName.text = dealsCruiseNames_

        
        let dealsCruiseInfo_ = cruisesInfos[indexPath.row]
        cell.dealsCruiseDescription.text = dealsCruiseInfo_
        
        let dealsCruiseDestinations_ = cruisesDestinations[indexPath.row]
        cell.dealsCruiseDestination.text = dealsCruiseDestinations_
        
        let dealsCruisePrices_ = cruisesPrices[indexPath.row]
        cell.dealsCruisePrice.text = dealsCruisePrices_
        
        let dealsPersonCounts_ = personCount[indexPath.row]
        cell.dealsPerPersonNote.text = dealsPersonCounts_
        
        let dealstop = topDealsNoteRight[indexPath.row]
        cell.topDealsNote.text = dealstop
        
        return cell
    }
    
    
    //onselect function for the custom cells
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        var segueIdentifier = String()
        switch indexPath.row{
        
        case 0:
            segueIdentifier = "dealsShowStar"
            
        case 1:
            segueIdentifier = "dealsShowSampler"
            
        case 2:
            segueIdentifier = "dealsShowCuba"
            
        case 3:
            segueIdentifier = "dealsShowBahamas"
            
        default:
            segueIdentifier = "dealsShowCaribbean"
        }
        self.performSegue(withIdentifier: segueIdentifier, sender: self)
    }
    
}

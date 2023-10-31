//
//  SearchTabViewController.swift
//  Team11_MAPD714_Project-Milestone2
//
//  Created by SAURAV on 2023-10-30.
//
// Team 11
// Saurav Gautam - 301286980
// Nibha Maharjan - 301282952
//
// Project- 1
// Milestone - 2
//
// This is project on Cruise booking app. We have to create UI and functionality from scratch using everything we
// learned in class and other resources found via books or online.
//
// Cruise app will have several views for various functionality.
// there is splash screen, a starting screen which has buttons for browse, login and register.
// there is tabs for featured which is the home screen then other tabs for deals, search, saved and account.
// there are individual pages for cruises.



import UIKit

class SearchTabViewController: UIViewController {
    
//    // Dummy cruise data
//        var cruiseData: [Cruise] = [
//            Cruise(name: "Bahamas Cruise", destination: "Nassau, Bahamas", pickupLocation: "Miami, FL", price: 1200.0, numberOfNights: 7),
//            Cruise(name: "Caribbean Cruise", destination: "St. Thomas, Barbados, Antigua", pickupLocation: "Miami, FL", price: 1500.0, numberOfNights: 10),
//            Cruise(name: "Cuba Cruise", destination: "Havana, Cuba", pickupLocation: "Tampa, FL", price: 900.0, numberOfNights: 5),
//            Cruise(name: "Sampler Cruise", destination: "Cozumel, Mexico", pickupLocation: "Galveston, TX", price: 800.0, numberOfNights: 4),
//            Cruise(name: "Star Cruise", destination: "Port Canaveral, FL", pickupLocation: "Orlando, FL", price: 700.0, numberOfNights: 3)
//        ]
    
    //dummy cruise data list
    
    var cruiseData = ["Bahamas", "Carribean", "Cuba", "Sampler", "Star"]
    
    var filteredData: [String]!
    
    // UI elements
    
    @IBOutlet weak var searchCruise: UISearchBar!
    
    @IBOutlet weak var tableCruise: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        tableCruise.delegate = self
        tableCruise.dataSource = self
        searchCruise.delegate = self

        filteredData = cruiseData
    }
    


}

extension SearchTabViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filteredData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = filteredData[indexPath.row]
        return cell
    }
}

extension SearchTabViewController: UISearchBarDelegate{
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        filteredData = []
        
        for word in cruiseData{
            if word.uppercased().contains(searchText.uppercased()){
                filteredData.append(word)
            }
        }
        self.tableCruise.reloadData()
    }
}


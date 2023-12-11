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
// Milestone - 4
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

    // MARK: - Outlets

    @IBOutlet weak var tableViewCruiseDeals: UITableView!

    // MARK: - Properties

    // Array of DetailsCruise objects initialized with data from CruiseData
    let dealsArray: [DetailsCruise] = CruiseData.allCruises.map { decCruise in
        return DetailsCruise(
            cruiseTitle: decCruise.cruiseTitle,
            cruiseImage: decCruise.cruiseImage,
            cruiseDescription: decCruise.cruiseDescription,
            cruiseDuration: decCruise.cruiseDuration,
            visitingPlaces: decCruise.visitingPlaces,
            cruisePrice: decCruise.cruisePrice
        )
    }

    // Computed property to get sorted deals by price
    var sortedDeals: [DetailsCruise] {
        return dealsArray.sorted(by: { $0.cruisePrice < $1.cruisePrice })
    }

    // MARK: - View Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()

        // Set delegate and data source for the table view
        tableViewCruiseDeals.delegate = self
        tableViewCruiseDeals.dataSource = self
    }
}

// MARK: - Table View Delegate and Data Source

extension DealsTabViewController: UITableViewDelegate, UITableViewDataSource {

    // MARK: - Table View Delegate Methods

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 480
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sortedDeals.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // Use optional binding to safely check if the cell can be dequeued
        if let cell = tableViewCruiseDeals.dequeueReusableCell(withIdentifier: "cellDeals") as? CustomDealsTableViewCell {
            let deal = sortedDeals[indexPath.row]

            // Populate the cell with data from the DetailsCruise object
            cell.dealsCruiseImg.image = UIImage(named: deal.cruiseImage)
            cell.dealsCruiseName.text = deal.cruiseTitle
            cell.dealsCruiseDescription.text = deal.cruiseDescription
            cell.dealsCruiseDestination.text = deal.visitingPlaces
            cell.dealsCruisePrice.text = "$" + deal.cruisePrice
            cell.dealsPerPersonNote.text = "*per person"

            return cell
        } else {
            // Return a default cell or handle the error in an appropriate way
            return UITableViewCell()
        }
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // Retrieve the selected DetailsCruise object
        let selectedCruise = sortedDeals[indexPath.row]

        // Instantiate the selCruiseViewController and pass the selected cruise
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let selCruiseViewController = storyboard.instantiateViewController(withIdentifier: "selCruiseViewController") as! selCruiseViewController
        selCruiseViewController.selectedCruise = selectedCruise

        // Push the selectedCruiseViewController to the navigation stack
        self.navigationController?.pushViewController(selCruiseViewController, animated: true)
    }
}




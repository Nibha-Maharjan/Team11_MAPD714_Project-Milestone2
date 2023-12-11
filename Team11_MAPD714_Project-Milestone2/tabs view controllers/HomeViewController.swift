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

    // MARK: - Outlets

    @IBOutlet weak var cruiseTableView: UITableView!

    // MARK: - Properties

    // Array of DetailsCruise objects initialized with data from CruiseData
    let cruisesArray: [DetailsCruise] = CruiseData.allCruises.map { decCruise in
        return DetailsCruise(
            cruiseTitle: decCruise.cruiseTitle,
            cruiseImage: decCruise.cruiseImage,
            cruiseDescription: decCruise.cruiseDescription,
            cruiseDuration: decCruise.cruiseDuration,
            visitingPlaces: decCruise.visitingPlaces,
            cruisePrice: decCruise.cruisePrice
        )
    }

    // MARK: - View Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()

        // Set delegate and data source for the table view
        cruiseTableView.delegate = self
        cruiseTableView.dataSource = self
    }
}

// MARK: - Table View Delegate and Data Source

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {

    // MARK: - Table View Delegate Methods

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 480
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cruisesArray.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // Dequeue a reusable cell and cast it as CustomTableViewCell
        let cell = cruiseTableView.dequeueReusableCell(withIdentifier: "customCell") as! CustomTableViewCell

        // Retrieve the DetailsCruise object for the current row
        let cruise = cruisesArray[indexPath.row]

        // Populate the cell with data from the DetailsCruise object
        cell.cruiseImg.image = UIImage(named: cruise.cruiseImage)
        cell.cruiseName.text = cruise.cruiseTitle
        cell.cruiseDetail.text = cruise.cruiseDescription
        cell.cruiseDestination.text = cruise.visitingPlaces
        cell.cruisePrice.text = "$" + cruise.cruisePrice
        cell.perPerson.text = "*per person"

        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // Retrieve the selected DetailsCruise object
        let selectedCruise = cruisesArray[indexPath.row]

        // Instantiate the selCruiseViewController and pass the selected cruise
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let selCruiseViewController = storyboard.instantiateViewController(withIdentifier: "selCruiseViewController") as! selCruiseViewController
        selCruiseViewController.selectedCruise = selectedCruise

        // Push the selectedCruiseViewController to the navigation stack
        self.navigationController?.pushViewController(selCruiseViewController, animated: true)
    }
}






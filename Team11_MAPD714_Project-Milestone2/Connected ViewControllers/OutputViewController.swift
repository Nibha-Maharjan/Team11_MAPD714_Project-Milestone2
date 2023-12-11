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
// Milestone - 4
//
// This is project on Cruise booking app. We have to create UI and functionality from scratch using everything we
// learned in class and other resources found via books or online.


import UIKit

class OutputViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    // MARK: - Outlets
    @IBOutlet weak var bookTable: UITableView!

    // MARK: - Struct for holding title and value for booking details
    struct Detail {
        let headingText: String
        let descriptionText: String
    }

    // MARK: - Properties
    var bookingId: String?
    var canNavigateBack: Bool = false
    var BookingArray: [Detail] = []
    var db = BookingDBManager() // Database manager for bookings

    // MARK: - View Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()

        // Hides the back button if navigation back is not allowed
        if !canNavigateBack {
            self.navigationItem.hidesBackButton = true
        }

        // Setting up the table view
        bookTable.dataSource = self
        bookTable.delegate = self
        bookTable.allowsSelection = false

        // Fetching booking details from the database and populating the BookingDetails array
        if let data = db.getBookingById(id: bookingId!) {
            let cruiseSeniorCare = data.cruiseSeniorCitizen ? "Yes" : "No"
            populateBookingDetails(with: data, cruiseSeniorCare: cruiseSeniorCare)
        }
    }

    // MARK: - Private Methods

    /// Populates the BookingDetails array with booking data
    private func populateBookingDetails(with data: BookingDB, cruiseSeniorCare: String) {
        BookingArray.append(Detail(headingText: "Name", descriptionText: data.fullname))
        BookingArray.append(Detail(headingText: "Phone Number", descriptionText: data.contactNumber))
        BookingArray.append(Detail(headingText: "Address", descriptionText: data.address))
        BookingArray.append(Detail(headingText: "State", descriptionText: data.city))
        BookingArray.append(Detail(headingText: "Country", descriptionText: data.country))
        BookingArray.append(Detail(headingText: "Cruise", descriptionText: data.cruiseName))
        BookingArray.append(Detail(headingText: "Visiting Places", descriptionText: data.cruiseVisitingPlaces))
        BookingArray.append(Detail(headingText: "Adult", descriptionText: data.cruiseAdultCount))
        BookingArray.append(Detail(headingText: "Child", descriptionText: data.cruiseChildCount))
        BookingArray.append(Detail(headingText: "Total Price", descriptionText: data.cruiseTotalPrice))
        BookingArray.append(Detail(headingText: "Date of Reservation", descriptionText: data.cruiseBookingDate))
        BookingArray.append(Detail(headingText: "Senior Citizen on Board", descriptionText: cruiseSeniorCare))
    }

    // MARK: - Table View Delegate and Data Source Methods

    /// Table view delegate method to set the height for each row
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 130
    }

    /// Table view data source method to set the number of rows
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return BookingArray.count
    }

    /// Table view data source method to configure each cell
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let selected = BookingArray[indexPath.row]
        let cell = bookTable.dequeueReusableCell(withIdentifier: "BookingCompletedTableViewCell", for: indexPath) as! BookingCompletedTableViewCell
        cell.headingText.text = selected.headingText
        cell.descriptionText.text = selected.descriptionText
        return cell
    }

    // MARK: - Actions

    /// Action method for the booking completed button
    @IBAction func bookingCompleted(_ sender: UIButton) {
        navigateToHomeScreen()
    }

    // MARK: - Navigation

    /// Navigates to the home screen
    private func navigateToHomeScreen() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let getToHome = storyboard.instantiateViewController(withIdentifier: "tabview") as! UITabBarController
        getToHome.modalPresentationStyle = .fullScreen
        self.navigationController?.pushViewController(getToHome, animated: true)
    }
}

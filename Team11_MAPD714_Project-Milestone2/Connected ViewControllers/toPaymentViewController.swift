//
//  toPaymentViewController.swift
//  Team11_MAPD714_Project-Milestone2
//
//  Created by SAURAV on 2023-12-10.
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

class toPaymentViewController: UIViewController {

    // MARK: - Outlets
    @IBOutlet weak var fullName: UITextField!
    @IBOutlet weak var address: UITextField!
    @IBOutlet weak var city: UITextField!
    @IBOutlet weak var country: UITextField!
    @IBOutlet weak var contactNum: UITextField!
    @IBOutlet weak var cardNum: UITextField!
    @IBOutlet weak var cardExpiry: UITextField!

    // MARK: - Properties
    var selectedCruise: DetailsCruise?
    var db = BookingDBManager()

    // MARK: - View Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // MARK: - Actions

    /// Validate fields and proceed to payment confirmation
    @IBAction func confirmPaymentButtonClick(_ sender: Any) {
        if validateFields() {
            saveBookingAndNavigate()
        }
    }

    // MARK: - Private Methods

    /// Validate all input fields
    private func validateFields() -> Bool {
        let fields = [fullName, address, city, country, contactNum, cardNum, cardExpiry]

        // Check if any of the fields is empty
        for field in fields {
            if field?.text?.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty ?? true {
                showAlert(message: "Please fill in all required fields.")
                return false
            }
        }

        // Validate contact number (expected to be 10 digits)
        if let contactNumber = contactNum.text, contactNumber.count != 10 || !contactNumber.allSatisfy({ $0.isNumber }) {
            showAlert(message: "Please enter a valid 10-digit phone number.")
            return false
        }

        // Validate card number (expected to be 16 digits)
        if let cardNumber = cardNum.text, cardNumber.count != 16 || !cardNumber.allSatisfy({ $0.isNumber }) {
            showAlert(message: "Please enter a valid 16-digit card number.")
            return false
        }

        // Validate expiry date (expected pattern: MM/YY)
        let expiryDateRegex = "^(0[1-9]|1[0-2])\\/(\\d{2})$"
        if let expiryDate = cardExpiry.text, !NSPredicate(format:"SELF MATCHES %@", expiryDateRegex).evaluate(with: expiryDate) {
            showAlert(message: "Please enter a valid expiry date in MM/YY format.")
            return false
        }

        return true
    }

    /// Display an alert with a provided message
    func showAlert(message: String) {
        let alert = UIAlertController(title: "Notification", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        self.present(alert, animated: true)
    }

    /// Save booking information and navigate to the next screen
    private func saveBookingAndNavigate() {
        // Create a new booking instance
        let defaults = UserDefaults.standard
        let newBooking = BookingDB(
            id: UUID().uuidString,
            userId: defaults.integer(forKey: "id"),
            cruiseName: selectedCruise!.cruiseTitle,
            cruiseDescription: selectedCruise!.cruiseDescription,
            cruiseVisitingPlaces: selectedCruise!.visitingPlaces,
            cruiseDuration: selectedCruise!.cruiseDescription,
            cruisePriceBooking: Int(selectedCruise!.cruisePrice) ?? 0,
            cruiseAdultCount: defaults.string(forKey: "adultCount")!,
            cruiseChildCount: defaults.string(forKey: "childCount")!,
            cruiseBookingDate: defaults.string(forKey: "date")!,
            cruiseSeniorCitizen: defaults.bool(forKey: "seniorCitizenBoarding"),
            cruiseTotalPrice: defaults.string(forKey: "totalPrice")!,
            contactNumber: contactNum.text!,
            fullname: fullName.text!,
            address: address.text!,
            city: city.text!,
            country: country.text!
        )

        // Insert the booking into the database
        let bookingId = db.insert(booking: newBooking)
        if bookingId != "-1" {
            navigateToCheckout(with: bookingId)
        } else {
            showAlert(message: "Payment processing failed. Please try again.")
        }
    }

    /// Navigate to the Checkout screen with the booking ID
    private func navigateToCheckout(with bookingId: String) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let screen = storyboard.instantiateViewController(withIdentifier: "OutputViewController") as! OutputViewController
        screen.modalPresentationStyle = .fullScreen
        screen.bookingId = bookingId
        self.navigationController?.pushViewController(screen, animated: true)
    }
}



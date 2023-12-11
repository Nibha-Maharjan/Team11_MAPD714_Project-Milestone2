//
//  PaymentViewController.swift
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

class CruisePaymentController: UIViewController {
    
    // UI element references
    
    
    @IBOutlet weak var fullname: UITextField!
    @IBOutlet weak var address: UITextField!
    @IBOutlet weak var city: UITextField!
    @IBOutlet weak var country: UITextField!
    @IBOutlet weak var contactNum: UITextField!
    @IBOutlet weak var cardsSeg: UISegmentedControl!
    @IBOutlet weak var cardNum: UITextField!
    @IBOutlet weak var cardExpiry: UITextField!
    
//
//    var selectedCruise: DetailsCruise?
//    
//    
//    
//    var db = BookingDBManager()
//    

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    
   
    @IBAction func buttonClickedConfirmPayment(_ sender: UIButton) {
//        if validateFields() {
//            saveBookingAndNavigate()
        }
 //   }
    
//    // Validates all input fields
//    private func validateFields() -> Bool {
//        // Check if any of the fields is empty
//        let fields = [fullname, address, city, country, contactNum, cardNum, cardExpiry]
//        for field in fields {
//            if field?.text?.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty ?? true {
//                showAlert(message: "All fields must be filled")
//                return false
//            }
//        }
//        
//        // Validate contact number (expected to be 10 digits)
//        if let contactNumber = contactNum.text, contactNumber.count != 10 || !contactNumber.allSatisfy({ $0.isNumber }) {
//            showAlert(message: "Phone number is incorrect")
//            return false
//        }
//        
//        // Validate card number (expected to be 16 digits)
//        if let cardNumber = cardNum.text, cardNumber.count != 16 || !cardNumber.allSatisfy({ $0.isNumber }) {
//            showAlert(message: "Card number must be 16 digits")
//            return false
//        }
//
//        // Validate expiry date (expected pattern: MM/YY)
//        let expiryDateRegex = "^(0[1-9]|1[0-2])\\/(\\d{2})$"
//        if let expiryDate = cardExpiry.text, !NSPredicate(format:"SELF MATCHES %@", expiryDateRegex).evaluate(with: expiryDate) {
//            showAlert(message: "Expiry date pattern must be MM/YY")
//            return false
//        }
//        
//        return true
//    }
//
//    // Saves booking information and navigates to the next screen
//    private func saveBookingAndNavigate() {
//        // Create a new booking instance
//        let defaults = UserDefaults.standard
//        let newBooking = BookingDB(
//            id: UUID().uuidString,
//            userId: defaults.integer(forKey: "id"),
//            cruiseName: selectedCruise!.cruiseTitle,
//            cruiseDescription: selectedCruise!.cruiseDescription,
//            cruiseVisitingPlaces: selectedCruise!.visitingPlaces,
//            cruiseDuration: selectedCruise!.cruiseDescription,
//            cruisePriceBooking: Int(selectedCruise!.cruisePrice) ?? 0,
//            cruiseAdultCount: defaults.string(forKey: "adultCount")!,
//            cruiseChildCount: defaults.string(forKey: "childCount")!,
//            cruiseBookingDate: defaults.string(forKey: "date")!,
//            cruiseSeniorCitizen: defaults.bool(forKey: "extraCare"),
//            cruiseTotalPrice: defaults.string(forKey: "totalPrice")!,
//            contactNumber: contactNum.text!,
//            fullname: fullname.text!,
//            address: address.text!,
//            city: city.text!,
//            country: country.text!
//        )
//
//        // Insert the booking into the database
//        let bookingId = db.insert(booking: newBooking)
//        if bookingId != "-1" {
//            navigateToCheckout(with: bookingId)
//        } else {
//            showAlert(message: "Payment failed")
//        }
//    }
//
//    // Navigates to the checkout screen with the given booking ID
//    private func navigateToCheckout(with bookingId: String) {
//        let storyboard = UIStoryboard(name: "Main", bundle: nil)
//        let screen = storyboard.instantiateViewController(withIdentifier: "OutputViewController") as! OutputViewController
//        screen.modalPresentationStyle = .fullScreen
//        screen.bookingId = bookingId
//        self.navigationController?.pushViewController(screen, animated: true)
//    }
//
//    // Displays an alert with a provided message
//    func showAlert(message: String) {
//        let alert = UIAlertController(title: "Notification", message: message, preferredStyle: .alert)
//        alert.addAction(UIAlertAction(title: "OK", style: .default))
//        self.present(alert, animated: true)
//    }
}
